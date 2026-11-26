Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142F2606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=orhk8wmR;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=S1tkk3tt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rcwwWM9GvLxFO7wEnKRfsxkMdjfGY6YIxp0vHgYizdU=; b=orhk8wmRpzdxgNbUq0Rs1RJkRx
	WJc239AImLMLq8rNAvLIJh5dWBst7RGQRd7D6RFM55JlBTlxKp/OPf3F5MnURH+N4zkFfALjkKMzg
	QwtbLpBoTnx7YyrwQ5BIzqaaQ7IbnBaLCLvP+gAGx8Mhvcb9ZyTxY31PL3T+mYnYeANeuLAXJPYvJ
	RWzJSKMS3HbQZeyPODXNdFogzBS2Afk5aOiPanz8pqUfIk9WExu6sRqi05AWQW2aNtsRh+S72GW44
	D0wOO+oWFkP3cSzwN4P35HENemU+eqvfTEh8PHkwUtXljZl2E33miMOWvpn1WUtXRSGHpCgjmllEg
	TMpdrATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVpi-0000000CZJY-3HMU;
	Thu, 26 Nov 2026 09:32:02 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVpV-0000000CZBs-2DwF;
	Thu, 26 Nov 2026 09:31:50 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C2E45205A6B;
	Thu, 26 Nov 2026 10:31:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795685507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcwwWM9GvLxFO7wEnKRfsxkMdjfGY6YIxp0vHgYizdU=;
	b=S1tkk3ttVGzY2gbM8EAG3whCKlIDfnd2EZx5p1A1lhb1SJomK9Jf/X3Wv+3QtEq+OcIpS4
	a+MtCwuxrS7zCJCyTAjzySpR1oZ19gEWKNkYCEeSTMWC9Mjomz69FA6uxJccqQ9Uk8eXXH
	mOrF/17T3E3P3yjvDahvtBVOaCEH/RYwqRnZI5YaBLWhvYyC455Ei4xzwwqNj7RWlqHXK3
	z49zwN1VoIUiGfyx8q313nTW7cCd41wq3a0mnptfNZ4eYMYz6DxD3efUwynO+mx9UNe89G
	nn3GO62tCUeRJEzVZjgF26ev+l2cgIDm5tw8omRRlJk2Y0zHY1CPt6Iy/+ToAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795685507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcwwWM9GvLxFO7wEnKRfsxkMdjfGY6YIxp0vHgYizdU=;
	b=Y/nJrvpfejmVlBONfZZTtCRFzYxCciQa5r9/goLWrU916FWAQgbrtBN0zWUs7NBSAlolF6
	csVFv9Adn/m304IUsEBPxBGJlPrBUlFO9ifuD+DuMIQL89C8/pD7/KQc0buHqa6EdUfdRc
	76JVARfgTmmU34Fw8uBi5dk2Ysh88PmgpCX6d6TN21/P/Kz8OcGk393BBbOfgkcu/n9VQM
	Xx63HBrH/b6aSym/AG5GOHpXJ5DtbNBxTW3tQYI1MccjxRGWH+MUEveAlZeSbQqHRa0NTn
	VlMKMVC5OiA6yse60KNKyPpEUl0L+49Xe9/rUPjHqTm/mAez0qWgx/Tg5xFQ6g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795685507; a=rsa-sha256;
	cv=none;
	b=Kp+dpiQ556oLAFF13DfJWsZvxi2zGTi+S7Fxfo5xTvToWdUTNzHHFjGqut0s33VG+9poNy
	Op5uC8o/V+JjcrRSXFvpmQO8/tb8dKXv+FrmGW+cgcmHwTyNqpEKO22GcupDHny+VBZ3db
	TQ8rroo51odwU5aUiYxrO+Gse4qvHVwR6qaGK0Wdk7r+PrXXsDGHHvi4qhK7Mv+S/wnUXd
	BL+wFGO7eBQZHKwpEWJNgpvJkm4fZdJsm1y+32D1yqLbAEn95/DvlwOf4MhMYsoeEO7Td+
	WsYjj0e3jcvKePj3/tjBImpW4+ulb4y78pPBKKTwK4/ji6On+mZNJ2E2YLek/A==
Message-ID: <3b661596c0c46390825c78d74843acf624c1494f.camel@pengutronix.de>
Subject: Re: [PATCH RESEND v2 3/3] arm64: dts: amlogic: a9: Add reset
 controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong	 <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet	 <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 10:31:47 +0100
In-Reply-To: <20261126-a9-reset-v2-3-e3d850e68725@amlogic.com>
References: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
	 <20261126-a9-reset-v2-3-e3d850e68725@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_013149_714387_005B2AFE 
X-CRM114-Status: GOOD (  12.15  )
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

On Do, 2026-11-26 at 09:24 +0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>=20
> Add reset controller descriptions for the Amlogic A9 SoC and include the
> corresponding reset IDs header.
>=20
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

This drops Neil's R-b from [1].

[1] https://lore.kernel.org/all/5a42cd49-e884-4a2f-8ffb-017828c556d7@linaro=
.org/

> ---
>  arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h | 247 +++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi    |  14 ++
>  2 files changed, 261 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h b/arch/arm64/=
boot/dts/amlogic/amlogic-a9-reset.h
> new file mode 100644
> index 000000000000..55fcaa54cd56
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h
> @@ -0,0 +1,247 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2026 Amlogic, Inc. All rights reserved.
> + * Author: Zelong Dong <zelong.dong@amlogic.com>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_A9_RESET_H
> +#define _DT_BINDINGS_AMLOGIC_MESON_A9_RESET_H

Maybe rename this to not include DT_BINDINGS anymore?

regards
Philipp

