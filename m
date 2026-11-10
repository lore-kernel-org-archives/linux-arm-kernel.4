Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2259F606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P6x+Sra3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQ3TF4Vo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=; b=P6x+Sra3vBk+FOYVegYhBJZNyK
	IhtbxWAmzq6ukDowLFLx0lfAD4WkPNxE/7GPGmT81PKbfYOhccC+ig6Dae+N4WR43v9Cvu4r4LBW0
	M0nUof24KMGFVgLmMsCRSv+4KAb8r4u6EtNuLnHSN7vBNhdnHoCcPOrWWgYtGg8q65V4prh/5Z5a2
	8dSbh35OzI8zTelZJddK3fL93Pt+hT+aobv9zMe31cNB7kWwSeKL/MNhb6UZDQ8rvPKOln8VZu3AR
	mvVFMHKY+tXB1/F2VHuPMD82aWPXeQ+7T5MxX9+ocvLHtM/kkqqNeMg6ohjFkJePKdiPuPgLdq7W2
	IyEG5Fqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoCK-00000004SPK-47Cd;
	Tue, 10 Nov 2026 15:55:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoCI-00000004SOD-1h58
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:55:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so18453375e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326144; x=1794930944; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
        b=fQ3TF4VoTGwkKVhNttSy6Ma3NJUVie/ZJv/tyl0gEr2Tuc/OrHAwfAnqN3NS3pCq3T
         /P+IK5jCUe7mTCK2bUicCg16ULM1e7O9g43H0jx9SDtQqqFYSk/ZuxaQZ5p0UufUPKYO
         SlS8OToDenGcIoOoprYiCICGVrXi0isYRtrlJiWriF7YH4/zdjVZ9PPc/IjPYjXP6KqV
         RrEHoumbSwv9wP+niHGbhJT1b45nLvfox5Xlg8ZhS6pHPcXqVpAbfii5b+vTE3BDAyPQ
         BnfbX2nd8Xgytne+sqChPMC/rl18d1fv8zxvoQGI3UGbBlGtuIoDfd8U56+jgRiDDLoB
         6Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326144; x=1794930944;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
        b=v3zsF3jAQPauNqcfHDKjBMgH1E8ocMhQZViytqKI+h3Lib09QA+a/+2qEj3zuK/AnL
         DgokQg3o96pfZn3E+BwErWt5RNc0fZejxSgItKl7lOURpTMH4XqXq3UV1zDtqXKs8sEW
         y2A3gY3KxV1y0tqRfaxSbnAHZOOFpcYhpKStTib9SUwDunCEgZMqo+NbEYuegk4eMjLU
         hps0e3VvxUqTstVEW0RTGBexxG+TmpQ+Ade6m7X+wu+kqTNhkLP/2Yu8gvehnhm4eW/s
         jZ9T8M3WVcUdD26Eu3ffbv6HqCTUZLPELAqIHuCvCR9M/yIdu2ISddmFt0kqA01Lh48Z
         KqXg==
X-Forwarded-Encrypted: i=1; AL+hErH5cMWoW8EnQ97ncwz8tduFVl5cRRANU4ih4OoKbiXYivMhaMJ777t31dQwv9CziP0bpnMxVhJIXRiUW/Kae0cp@lists.infradead.org
X-Gm-Message-State: APuU4Z+VTN221iIaePctSROkruaRXFxpVBvnFEDZD7IXOG5MdFDOiGCo
	tLUDFzrJpba9c54Df7GIPUg4evAczDkNhCr+PlOP8CCEbwKMdWUZgm2s
X-Gm-Gg: AYBFou1cx1dakEq4HDnZrZpXKHSdc0qiHABncY1VNoJByhVChnIhsD0OS4+9lcO4BNf
	Ds8Jf6MhwNFCFr7PtY/jOawxLFKWIBQDqq9eZ0jbwYJJmRQhlc4hCC5n6yLMrs8e2r9nRQfVa7F
	9AupQAA9Y757bIA6YCa3t56V9stJ174kp7k+MAw9O9LXkWgc0QkGIdQBcB/2bT1kfAurPJRawKe
	SRq0GxhxWVXgOE5eGMx+WU0E/zPaRQ1ORLUIpvnzJHy/1mv822k+iB9Rf8KnZBWJ6n+03Q+iEk2
	og0C2US2Eigi21nszK91mnhlju/f4F9z49T5wgB8d3l+I9DLBqADFGpY2P2K01opSBZJYzCxN+x
	ncVOFlR0D6gONPR57iI7z8wsHvoqOTAq/+5gGMpLYpwJhI6oiYDbxWDLexLrPVqEvTkNo5M4R+x
	A0FSoo0kTwDErQj/n0oKVQHSxDdlcO1jD4/kw5V4fP3b/JXWpndyLLVe4zjsTOxYe6AdXdiZB12
	je55xkEQ6LxRJOQY/SHhfWP2gOgNnrepwEgaWY6bVy/8208RWqo54zkPE22U+otC/ctJf/U6Iwc
	7+/Bo168a6mGxrqDeRRx+YtjiMzWfQX2YRp55lfila7mHueFx15QFKP8BVhHEPysWo9uQGrnh7R
	KIP7B/RbjIOpilzEUq6Vv0khPWNWYwd+u9+p/TZTw1vEb1xL3G/pzx9j1pqqYMJSHYyCJIMyUea
	knceOtbEDui0EfLGe8saWRP4mWPRn8OZaN1xdBr0NyrFS1mUPBa7JzGkjVpm3MZH3fw3HsVsGVv
	fBWxDDO3wyQJnwvdKE1S3h/ff3jqkcCB4mwGi03cFhd46BeV7CKHw==
X-Received: by 2002:a05:600c:c4a3:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ba02308542mr51845065e9.2.1794326144134;
        Tue, 10 Nov 2026 07:55:44 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm73237085e9.2.2026.11.10.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:55:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: sunxi-ng: h616: Let the S/PDIF clock set the audio PLL
 rate
Date: Tue, 10 Nov 2026 16:55:41 +0100
Message-ID: <ThOkLORdSauix4Mt72r-lQ@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-2-e5e36e8963e4@gmail.com>
References: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
 <20261110-h616-clk-emac-spdif-v1-2-e5e36e8963e4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_075546_463316_76305D28 
X-CRM114-Status: GOOD (  20.59  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne torek, 10. november 2026 ob 07:03:01 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> sun4i-spdif asks for 22.5792 or 24.576 MHz on the S/PDIF (OWA) module
> clock, depending on the sample rate family. The spdif clock has no
> CLK_SET_RATE_PARENT, so it can only divide down the rate pll-audio
> already runs at. Unless another audio device has already set the PLL for
> the right family, the power-of-two divider rounds down and the request
> succeeds at a wrong rate: about 12.3 MHz from the reset PLL value, so
> 48 kHz content is sent at about 24 kHz.
>=20
> Propagate rate changes to the parent, like the audio codec clocks
> already do. This is the same change as the one just applied for the H6
> [1].
>=20
> Link: https://lore.kernel.org/all/20261104185027.883011-1-jernej.skrabec@=
gmail.com/ [1]

There is no need to link to H6 patch. It's clear that patch is needed.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 C=
CU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index d2625fec651a..f703d690a563 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -529,7 +529,7 @@ static struct ccu_div spdif_clk =3D {
>  		.hw.init	=3D CLK_HW_INIT_PARENTS("spdif",
>  						      audio_parents,
>  						      &ccu_div_ops,
> -						      0),
> +						      CLK_SET_RATE_PARENT),
>  	},
>  };
> =20
>=20
>=20





