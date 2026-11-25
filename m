Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B22606A69A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1AuOPEqF;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=LYGMw0Qv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FFJHi0dR0AO+OEGY4MeKs6pRNpL3MVWLGWF8iylf3Yc=; b=1AuOPEqFRkzG9ri67C2kN6ERm7
	Wsch/bci38m5GJFG90jmByLwZIP3YnYWdtTSKhv57G6FfTM9zybVm3j4l3/WwzMsodVz9S7CawXAz
	AendrRU40sGRAL5fJwpKqgN5rh9QdiTCIcCZ3nsQOrv1rf0MUA6eX5dX2n4lrVHrFc1VgauT4l04/
	2ar1gKxEa+ebOEKKJNqP1JTK9qzeeXywkBQHtniy/IfqNM1Yk6qEnFsJxZY/SNvht+YWJPobbd0NC
	xgn9t+ArxuIBnAg/FFYpxwpmCtE2P87l82cEGZaIyaqT+EWjvmnb/WI3nzGyuPRDJGTkIm1g+/P7h
	DAA8rJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJkf-0000000BIIT-3sAI;
	Wed, 25 Nov 2026 20:38:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJkd-0000000BII4-1lUm;
	Wed, 25 Nov 2026 20:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FFJHi0dR0AO+OEGY4MeKs6pRNpL3MVWLGWF8iylf3Yc=; b=LYGMw0QvymQY6YdmN62UkknNG+
	Z+Lx1xbk1xdhB9GBln5d+V3iP61i9cFgCMFolwNC+rZeDR7YPZgkxRsuJNrBA4TzXeQOGM1laPY75
	lTW1mhlH1CPhVOQI8S/8dQNBUusr/ThV/HAqxP6Fq9atMkvCeghkY5r+B/tmh+QueDocp1SJMTWXx
	LKB58IPgucu2wfPcQxDtzU3D83KuWKaqu83RZRkAlGLzvzMZvObkvGOQne6zSrXzcOAdrLeBh8foZ
	Am09wnn7SVUWi4R0ot8fFx+ZB8r3QhxGNDrge7sy6S7sc5SO65Qx27kk0y33glvAWrsxdiwgNJlIv
	hnVdJwDw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Midgy Balon <midgy971@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Freimut Diener <f.diener@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Freimut Diener <f.diener@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: power: rockchip: Allow post-init-providers for
 domains
Date: Wed, 25 Nov 2026 21:37:49 +0100
Message-ID: <oJj2NKd1Svmsn320H8YWrg@sntech.de>
In-Reply-To: <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
References: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
 <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_123759_489586_60DD8C3C 
X-CRM114-Status: GOOD (  14.97  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Mittwoch, 25. November 2026, 11:33:57 Mitteleurop=C3=A4ische Normalzeit =
schrieb Freimut Diener:
> A Rockchip power domain can have a supply that is required when
> powering on the domain but is not required to initialize the power
> controller.
>=20
> Allow post-init-providers on power-domain child nodes to describe
> such dependencies.
>=20
> Signed-off-by: Freimut Diener <f.diener@pengutronix.de>

Interesting that this exists since 2024 and this will be the first
user it seems.

I've looked at the dtschema for it, and this looks really great for this.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> ---
>  Documentation/devicetree/bindings/power/rockchip,power-controller.yaml |=
 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-contr=
oller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-control=
ler.yaml
> index b41db576f95de..d2b512dd95f63 100644
> --- a/Documentation/devicetree/bindings/power/rockchip,power-controller.y=
aml
> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controller.y=
aml
> @@ -147,6 +147,9 @@ $defs:
>            A number of phandles to qos blocks which need to be saved and =
restored
>            while power domain switches state.
> =20
> +      post-init-providers:
> +        $ref: /schemas/post-init-providers.yaml#/properties/post-init-pr=
oviders
> +
>        "#power-domain-cells":
>          enum: [0, 1]
>          description:
>=20
>=20





