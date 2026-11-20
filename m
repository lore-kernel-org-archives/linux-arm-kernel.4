Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CE0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5GpphvM5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FO+VJ7CK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UR5Yzs/oFvUpg1Sblo1/aojO43HzfrnhOihYQJjm9Rs=; b=5GpphvM5c+2fFkFRqOku7UPR5M
	A8caJKSyREuyKcw7VVV/LyTBW+WrLYzisvIzmDb2xkA1D+516U5UZ0CiPhlJK354TEyffyq9LuLIu
	EeB4O3bjSeWZDfKZngQvoNKTepHosYWSsBvGDsfqnsBb1oR+akY5gd3X/kzFSkB3ISmewpMfKdQtz
	XE1VfAPFZzSPCLtk//3iro9We8gseGnY0f/H2P9adJuqbV4oB5oOMfJzAm/alHyRhgoa7bTodvByh
	rTP+n6LywI47RVIGJiNAaJYUHw9XtyVs3PzLY+H+qwvXDxPAEIl9fAkKJf1fjmKU+Yi5IIKgcc/+V
	wfGGIapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGly-0000000E3G5-0Vpn;
	Fri, 20 Nov 2026 05:02:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGlv-0000000E3Fz-3h9u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:02:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBD6660626
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59611F000CA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795150970;
	bh=UR5Yzs/oFvUpg1Sblo1/aojO43HzfrnhOihYQJjm9Rs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=FO+VJ7CKnrtrNobYSBza6XeHT02s8nna+qPJtIOMEiXcaaagVJDNTlw7htFigim50
	 9jMcYRhtlu4/VAU6qyU/cllxszBGbN11HqQ6DrB+Dg4b+vFf0ZImpR2QvVOgDJFZrW
	 G+vliQjLafirSXm6CoTofJEX/EwtvJH2203ec1c40VjEmpCYSNqlDbUaMpfr9ajaBb
	 JemZ/Fm2iSUMTVCFb+PijP2HwJL0ERaPqPqkhoh4phPOJUNLQX2jfy2QfbvuNn+ed9
	 kikSIPEBafpOqL2gdy1Qi9gVWd7qI0kQ63F8VzAdrfPL/wvwHm6zDGhkg7i8HJqm4I
	 37OPVulaSnhQw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab4354db11so4257371fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 21:02:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG5Axxz9ykJ2Q3aBaLFbElSe7NKybks1RIuJVlSbohhz1ItZkHA9xPGa/nlRD/xB3K/E2SxdL0UmRLKhPJ+hKyb@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZOlUea2UWYOaNO3XHabj51DURFqhsrPO+UCB3To78bfO0JyQA
	AF90bHQKITJbduGiYWAeicY2x5alRIOQ1vWezWgsi0sukHVbZyInHAJeYewjhLGTNvY35gqxAEA
	bLNOaE52/VnRyh91cHBNWlSUotCRKDaE=
X-Received: by 2002:a05:6512:3a89:b0:5c1:5975:66da with SMTP id
 2adb3069b0e04-5c1bc686852mr492882e87.2.1795150969118; Thu, 19 Nov 2026
 21:02:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
 <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 13:02:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
X-Gm-Features: Aa3M54qNcqF7z40wKma44B-tprBWYu7aZzF6KOEzN8MUiDG2dextbs8dFAlCz5Y
Message-ID: <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 8:09=E2=80=AFAM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> UARTs use APB2 as their baud clock. Expose its existing clock ID so devic=
e

And how did you discover this? How did you differentiate this from it just
using a combined clock from the UART bus gate, which is also driven from
APB2?

I'm not adding this simply because you want / need a baud clk that you
can set the rate on. That's the wrong way to go about this. You should
just add CLK_SET_RATE_PARENT to the bus gates. And making the bus clocks
variable is a whole different discussion.


ChenYu

> trees can describe it separately from the per-port bus gate. Keep the
> existing clock numbering.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bin=
dings/clock/sun50i-h616-ccu.h
> index 6889405f9fec..e3318772c92d 100644
> --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> @@ -11,6 +11,7 @@
>  #define CLK_CPUX               21
>
>  #define CLK_APB1               26
> +#define CLK_APB2               27
>
>  #define CLK_DE                 29
>  #define CLK_BUS_DE             30
>
> --
> 2.53.0
>
>

