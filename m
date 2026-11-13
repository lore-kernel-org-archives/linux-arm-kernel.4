Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D281F606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HsddFaLU;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Z+kKRryW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4yDZRfV74gzkAKxidzXBIKvKLnHRDrSBTaKHel/+/uo=; b=HsddFaLUMs7F7g0CrBv0qypf8K
	evgH4kd23K90INFYFdBflLMCV5mqmQkekitICsXDh1dM8KPv40epJ0++EI5mbdUtT/swpuo+DDk99
	wm4oLI9sue+NbOPwwK7Aso1oasnw+BgOdZ+ynyH4gmAyqtWHjd1+l92yXyIRfC6z/TJw6zTxakHyk
	ynWZD9StneGEN2ngPfbQK5K89jLCPH+DEz7rWUO3EidibKpqiGY+bx1WMzNwTE1AdELNTDVStsbwx
	chXCukb8Xh01zxq0E/9J5c0+jTTasLcoiRq5eE0ZEy9UxuxcAVZilDDmMB2PePG49nra9EAD4QHHQ
	ZLcDJWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyCM-0000000EUIh-0pST;
	Fri, 13 Nov 2026 20:48:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyCH-0000000EUGF-2hCs;
	Fri, 13 Nov 2026 20:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4yDZRfV74gzkAKxidzXBIKvKLnHRDrSBTaKHel/+/uo=; b=Z+kKRryWqzzXo7N0Sw4YRsMx0U
	ooA+n1KLL0vRvKl0ksWJUpF9NphOyllBA22gtQf7PrzXQILiV6FaI/cu2r8f1aCbIVIsV7UD+w8Hn
	79hx9VjKATUDTwLleielum70OnlKZgJeLDSRKRw3bjQYxzj+OlNY7CXCLwmcqovn2xzjI4ZBdL/cn
	d7NOhSl43eEOEjqhkumM60IyzCMvg7w1dtGaOAryVbXttvgmOdQOXWzZDf49l0XeZBEd0QoszaxVB
	+9OG2VQbQYAzRRbxtt4GBeU7CD3941BdZ2eoLGLXpYhbl4B8bEHP5n+4yQ0vQQ9yVFegqy/jiP3t1
	WY3BVGJQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, david@ixit.cz, detlev.casanova@collabora.com,
 maz@kernel.org, michael.riesch@collabora.com, diederik@cknow-tech.com,
 shawn.lin@rock-chips.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, tglx@kernel.org, daniel.lezcano@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Fri, 13 Nov 2026 21:48:28 +0100
Message-ID: <OwFpcaCvQyCpxGXRrBGjPA@sntech.de>
In-Reply-To: <20261103192331.394489-2-macroalpha82@gmail.com>
References: <20261103192331.394489-1-macroalpha82@gmail.com>
 <20261103192331.394489-2-macroalpha82@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_124833_689270_C87A9088 
X-CRM114-Status: GOOD (  12.23  )
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

Hi Chris,

Am Dienstag, 3. November 2026, 20:23:30 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add compatible string for Rockchip RK3568 timer.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

can you ideally send this one separately to the clocksource people, so
that is maybe is clearer that this patch should go through the clocksource
driver tree?


Heiko

> ---
>  Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.ya=
ml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> index 6d0eb0014eee..b245a3051d66 100644
> --- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
> @@ -24,6 +24,7 @@ properties:
>                - rockchip,rk3228-timer
>                - rockchip,rk3229-timer
>                - rockchip,rk3368-timer
> +              - rockchip,rk3568-timer
>                - rockchip,rk3576-timer
>                - rockchip,rk3588-timer
>                - rockchip,px30-timer
>=20





