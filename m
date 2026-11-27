Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=opqtALRS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BkCVZzVI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=; b=opqtALRS+lw/wJ
	Hft4lki1vPOFdhhXt8pIYVm+PSKhKWDzXrw38fV8tDEXShlMXcXh5Y1DpdOvwL3E1ZrnORnyOmBK8
	4IESsXeM99jw66voxHAfLaWFQexjUVVONOTlv/b3j3g8/L0jpikBHwLFpap8g2gE+jtyGWMxAaFG8
	xFH8UAs90P5BF37TPjltVn5/rRVASo4raDfBALzKq571U216ZDbw0XlvwD90SlRRcZWUAKpXJhGxk
	tHc4X7wXP1JENk2N207VIjyH/uxak1uwzjFW/J9/VRrEekvuMEt5WMUw71/vQQyV4V42WvumY8cU5
	ILxfQ3+6bE2fiZI+tUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Lk-0000000HMrQ-1oKf;
	Fri, 27 Nov 2026 18:07:08 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0LW-0000000HMjn-1tW6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:06:55 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6d68de53053so6156529eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802813; x=1796407613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
        b=BkCVZzVI4O8CxaJqwST6YWDE5XoxJDQXwU9NJWVDsm9UabR5bP5y5YzuVmUayq2fkJ
         KF4qp4XRyR3X8EX1NABYKFnGKd6kRDC6xsRlLcpjuCDlzH7ShFQtvE7JkW+69Ckecg2B
         dIkghGEvXItcYtfAj68zf3odE0VVzzo6Xp2EcEpWpRNpvWWfVAJPgvK0PXfwBpGw4AYm
         mz65DJBY+ksjfrykVs35UoYF0TxZcRiqRHK0xXSxeEMYfvWxVRnWN2zs/nmFDsXhKzEb
         pzLraMlmXyamjXpR1ervVIuM/8XYX7bVoiQvLYO+/Xm3WwyxH99zrhsW731SeNkr/99W
         pEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802813; x=1796407613;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMhmizF9rm/NvUf9wXz1bzC79f1tk9PLdnrYZqqxQsQ=;
        b=I7B8ax6OuQrJGzPb/7XDGUDrhEocXUxM8WLg1WXYKHp6ah1km/NnMSRjse+miyA7vJ
         3psvmySOR3jjZzPhS90+uUXAc9uXCb8hxhrQTfdacRBmeRM+RITO6ri5Sb22E2sVIpQS
         pBWHhlPB3FUCXiLbsNOjKJMgQ6Ps+GCcz386suvQGSUhjEof5icqrC2KeCz2WXelBgKG
         Y2T9fXRpAWdT99gr4XAwloK/PLYb4DniY5U4t1DGdatWpSYPzlEE1tRkrCL/lRnGGft7
         MfT8hilnG42fgbeyNnNHQPUwrtyHt9vB5XbRxiImweZtXC5TN5hTgmVFwloTrjnykIVB
         knHw==
X-Forwarded-Encrypted: i=1; AL+hErGoC1VDJ+4986h7/i62UzHNGV+OvNJ53DB+E61yrlBNr1eWHei3rYEWTHCnv3zG0HlHlZkXJekfqcL+RkX+tPcT@lists.infradead.org
X-Gm-Message-State: APuU4Z9MeltMIeJxkDByWGK2Oy+YyPn28uDKiHt3e264jZZo+PnctMH3
	GRhXhiuM9p9gcX/O8GqN8hCGw5k1gXCwO0oCp8BF2eMa/RHY2a+4kttr
X-Gm-Gg: AZFdTZdFjfEvpku0RKfJGQ00kGaDhea0Gl0I59DqUa/QzWjOhwJ2U9/Iu0jcdvCz+AT
	kBLB10IiomdnwMn39cyDsq9txbmXpOgriT8Znv3b6bPcv2eFLEO7fkrzETmNIrLF6e/2EfkaSpt
	dECWMY00PGpczDl7e8X23cyKDOYQS7batcOj3xS7fm/SYmJwqCy2EJSAWOgUHTQ20WPjZhNZncg
	pkLbX58ZPBIhAEERNLlhewIDB+SWAHFvC+vjTtG0Uv6LQDJkXBv+lwwpO23ZTH05b8SWyn0btSl
	cluRru3WYqlbFPPeUdk/odNPEPfmLy2Dz9xOrtQGczWwj+jexBRSbQli9xrMWHD6auwKbtPwi15
	Z57UWroLQEs7QJVf+mjG4gHM3XA5rvPdRkBErhr9HSkgGknYskLplbLMZQpWn+LzjEl4IsIa4o9
	XDcOITr3TggiD9txScCKQ4rYkyfF2NtvAl2s/SZljIuNEQ/8JmbeRTWOXA4Flu/lUClyifw+l/J
	15sJhB98bTIeYWEw9IQUpG8e4g9OSmAdvCegvFCXHpVbVKpfFKUxGoY7Wji79zx2ZdeTY/jXja8
	q02bMkbOzmJcMRkTz8/i+0LhsQ0U+JlyXmvJGRqN7Hlv/82pqHhGoUj9NSm9UnjbB9IvHFWhBTB
	PPvvgnw==
X-Received: by 2002:a05:6820:a74d:10b0:708:c97f:5541 with SMTP id 006d021491bc7-71b394868bbmr14209997eaf.37.1795802813364;
        Fri, 27 Nov 2026 10:06:53 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f6d33sm17220715a34.18.2026.11.27.10.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:06:52 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: jernej.skrabec@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Date: Fri, 27 Nov 2026 13:06:50 -0500
Message-ID: <20261127-a733-dt-v6-01-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-2@gmail.com> <p3YaXlLJTguQBGnWyMpb1w@gmail.com> <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_100654_507764_9765CF5C 
X-CRM114-Status: GOOD (  14.00  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> But it's still compatible to the D1 MMC controller, isn't it? As in: a
> driver capable of supporting the D1 MMC IP can also drive the A733 MMC.
> I think the voltage regulator is a separate problem: it's external to
> the MMC IP. The vqmmc supply property is documented and usable, and the
> availability of the regulator it points to is a separate issue.
> The same as the H616 and A523 have the voltage switch already, but are
> still compatible to the A100 and D1, respectively.

Agreed, and the manual backs it. The A733 User Manual v1.00, section
11.3.1, lists SDR 200 MHz at 1.8 V IO for SMHC0, but the SMHC register
list has no voltage control. The Port F pad voltage is chosen in the
GPIO block: GPIO_POW_VAL_SET_CTL at 0x0200_0070, bit 0
VCC_PF_PWR_VOL_SEL (0 = 1.8 V, 1 = 3.3 V, reset 1), section 18.14.6.3.
So vqmmc for mmc0 would be a regulator provided from the pinctrl side.

On the A7S (schematic v1.10, sheets 4 and 7) both Port F supplies are
fixed rails: VCC-IO, 3.3 V from SWOUT2, and VCC18-PF, 1.8 V from CLDO5.
There is nothing to point vqmmc at today.

Unless Jernej still prefers dropping the node, v7 keeps mmc0 with the D1
fallback and no-1-8-v on all three boards. The Port F switch can follow
when it exists.

Jernej, if your "emmc" meant SMHC2, I can also drop the unused mmc2
node; no board enables it.

Enzo

