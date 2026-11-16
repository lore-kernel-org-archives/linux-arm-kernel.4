Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BB5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QBKboXjg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nq1fDbjm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1IKEWtPTLjM1XYaZ0STp/scHGqJtVbGIZgdMjNsrQOo=; b=QBKboXjgulZDIA2mbA8SNb55Mt
	4jI+Q/pDEjhVquxOS6pqOasUD3PVGkZN0V68+41CsBsx4jK79kPU9HE1bXuaRnehxWFCjsgvpp6tQ
	3SvhpAmEe4JQOYJnTrvphPl5BPnWXLS/K5dPcaYCJCbyedzXTvqc0GoL/U05uLXVzGhB6FRZWffxP
	EGfvLbIsWYaRAkHAYoVP1gvEwI9XBfeY5nRIQ2H4MKrliRY3XdNtnrpJE1U4PCZJdlEJL6Tmr6xXv
	EG2GTOMBRVdg4Tib3ddy/vVV2tcmW2tz7Hx4qME4k2EI+4DzmI4kwdLulO/41sFPPfRDRKFboWeiD
	TOH9QSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStTn-00000001rmd-3I6U;
	Mon, 16 Nov 2026 09:58:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStTl-00000001rk6-0KXC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:58:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so6348185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 01:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794823102; x=1795427902; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1IKEWtPTLjM1XYaZ0STp/scHGqJtVbGIZgdMjNsrQOo=;
        b=Nq1fDbjmy0EOxq9T21G64Tgk+V60lGagyRSoH3YeUn8PiZrmW1hlZpGbbrRiSxdavQ
         sqU4FUUfaRNf4YYEOp4tlXW4/kZCU5YTOlTtp+4YLuw9Mb4G/c6DxP0HuOCMgEKZqyuy
         qSjwbEeV4je3+e/oE1Pk6ly37Qs2gT3o3MtyZ47+rEJQW1t0/BKM96QX01ahzBWLLh/u
         kSBS+LPnq9Uo3u+GXbolNFq7n6xSA0WC9GN4jImWITUsconcBSanDwCL8ckKMn7PnTTo
         +/lUY9LZ12LRG+FpLAt4YJqEPZJNvIAavtU/JshXHkX5DiiJ4v4rByn2AZjfLzTsWDCS
         baEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823102; x=1795427902;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IKEWtPTLjM1XYaZ0STp/scHGqJtVbGIZgdMjNsrQOo=;
        b=qA0HKh4oBHT16yHaHm5jS9yifwVsPQ8MgqSIIgtYawqvDpn8SF3KVzMvmLKxDLF7Hk
         Jc98X36Eqf7annonIC5RlthFAY8T33rOzhgaLt/psFlZ6QQHfA8zvXdSjz5hTpC90ymt
         6Fogk8m+V5MJS1GlIgQ1TD1x64Iu3WbBGEIWLROTX6kJmc644Ga7ls9vLMMFwBQge5JU
         /NPZQu/guaCvVatXGAvUMG87viBGWDtuSMhaZqQ+IXbbz8DUxxigahymc8O76a0W6jAd
         h8Y0ALgferhdhBdMi/3MoET2TdtU//srhrLrrNY1AHjtbQ4dijE9fMMioPmZwKraNBBK
         5x+Q==
X-Forwarded-Encrypted: i=1; AL+hErFOdsYSQSsJ9K71fekAZyb+PEQ3hwN33f1lXjjq2K2IzRhhoVDrMOUWrcGAlqi8XB+SwGv0qcOtvLUYiqgaWhIz@lists.infradead.org
X-Gm-Message-State: APuU4Z8TiN+9cvZ+PvRT87mj22hkOWh0kCWQlBJN2O02eLFZgLTJTP/V
	RapFtUKkhcvkAQ1FTdwe4TyBnnK+O2mu3FhsCcJF7vDP8EJm1ga9C8+g
X-Gm-Gg: AYBFou1Fq2TEJrCym6AB4ugQD+Kw0RUxnePZVfy1MrqVFAZumZJwYTfG89GKSvO7qMc
	tWJb7PoQOdW+VntZK5If+7iz1ktYGyFIIvq5lUiG0+NYVsnFEdABYHUj4/Q5IPGybXZxs2gz5VP
	6R0lul3fnEJ78DAzPlMtmsL6udmr3bRf0ZbZlp2IjBXcUAhc+hwOIBLXStBNXyHhLOEBXOXzU8W
	M/CNreOkbOiQyZECWKst9s4memDBp6CmTISs7kRjV5Dj7uM5suPmQQOT0EVtF3VJByM2yAVOsvL
	Lzi8XanFTGFtYoRRBr0T/CJoAGD1xtmvqN+5maT+Dr3oKRy/wg8HsEf6cqKYZ5bcf4opUcU3Mo2
	Syq7CTpT74/p7wQjo93/bBXaZinvU+xJOzgucb43aHSCByviD+L862UOMeVHUxmEp+QZ5d/s/jK
	8Y2nzuR7g/0PrSXbaTyRV0eqVfWVYUcU/kjoRzBWewEA6Zy5J9iYKqE84uyPxfyIc5fodmQx2yz
	FvVUS/5KJPXHEcsflCtrZmgZUQgMk3fq8GrIDj44iGhQquIhHO+x4YJErJhzNCNMTvPuCGNAqNZ
	LoyIIOQEJsgYFeLClTV9d7kviruCzeyMAKMQPtXjMBLOvbYGZzkHvgNJmBQ6sPn0hv4hxmq0
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb605d90f1mr145813425e9.32.1794823101861;
        Mon, 16 Nov 2026 01:58:21 -0800 (PST)
Received: from ?IPv6:2001:8a0:c4c6:f00:1399:6f7e:7235:850f? ([2001:8a0:c4c6:f00:1399:6f7e:7235:850f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm112615705e9.1.2026.11.16.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:58:19 -0800 (PST)
Message-ID: <4c5562a2d384fc530be2773a49b7380f3b009e61.camel@gmail.com>
Subject: Re: [PATCH v1 0/2] dt-bindings: display: panel: Add LG LP156WF1
 dual-LVDS panel
From: Vitor Soares <ivitro@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang	
 <jesszhan0024@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nishanth Menon	
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo	
 <kristo@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, Lad
 Prabhakar	 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding	
 <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Nov 2026 09:58:17 +0000
In-Reply-To: <20260529110518.624454-4-ivitro@gmail.com>
References: <20260529110518.624454-4-ivitro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_015825_125791_C41280F3 
X-CRM114-Status: GOOD (  18.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

On Fri, 2026-05-29 at 12:05 +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>=20
> Add support for the LG LP156WF1 15.6" Full-HD dual-link LVDS panel and
> a Verdin AM62 overlay for using it through the Verdin Development Board
> with the Verdin AM62 Mezzanine LVDS interface.
>=20
> This is a follow-up to an earlier attempt [1], where panel-lvds.yaml
> was incorrectly extended to describe dual-link panels. Back in 2023,
> when a generic dual-channel LVDS binding was proposed, Rob Herring [2]
> pointed out that dual-link panels should follow the existing
> advantech,idk-2121wr pattern instead of introducing a new generic
> compatible.
>=20
> Following that approach, this series adds a dedicated binding for
> lg,lp156wf1, with the dual-link LVDS ports described by
> lvds-dual-ports.yaml, and excludes it from the generic panel-lvds
> schema selection.
> The second patch adds the Verdin AM62 overlay for the LG LP156WF1 panel
> on the Mezzanine LVDS connector.
>=20
> This series should be applied on top of [3] to avoid conflicts in the TI
> device-tree Makefile with the other overlay additions.
>=20
> [1] https://lore.kernel.org/all/20260521150038.103538-17-ivitro@gmail.com=
/
> [2] https://lore.kernel.org/all/20230130170441.GA2796575-robh@kernel.org/
> [3] https://lore.kernel.org/all/20260522161105.277519-13-ivitro@gmail.com=
/
>=20
> Vitor Soares (2):
>   dt-bindings: display: panel: Add LG LP156WF1
>   arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS
>     panel
>=20
>  .../bindings/display/panel/lg,lp156wf1.yaml   | 105 ++++++++++++++
>  .../bindings/display/panel/panel-lvds.yaml    |   1 +
>  arch/arm64/boot/dts/ti/Makefile               |   5 +
>  ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 131 ++++++++++++++++++
>  4 files changed, 242 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp=
156wf1.yaml
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-=
lvds-lg-lp156wf1.dtso

Gentle ping on this series. The binding has a Reviewed-by from Conor,
and as far as I can see nothing is pending on my side.

Let me know if a rebase or a resend would help.

Thanks,
Vitor

