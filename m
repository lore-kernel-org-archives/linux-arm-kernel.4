Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB27B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ptt4kShy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xb2TsqU5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LTw5++e2w+iexPjIRtRx5h43jD4fgvwWeeA/d7rdnwU=; b=ptt4kShyrTUPaKS5Zim3LomXWV
	i9YnCr3VRofdUrB+FgYt6fqFbC8RKGFECV6YivfQMP3JjDSPreKkFokw2MoGe1IN3VIFjzzYbJE8Y
	H3cWfbCtU0+omioSz7zLHDfJ7BZIzyGrcY6OxV1tEKalpkwIGewGv3E7wC2Vy2oy7caUABZ/P8zQk
	o6G/Vrg7HrEy00H1C/dtnoRnIX4hxAwlodOSJNJUEemcRntzJ75djuCi6SrR4EaWoJhHaw1D0KJib
	ZrcEyuEvVgu9zlJho8D4Tpr/6aLQVI/8kjm+Cb7i67TSpIgGQAFGTqWIOQ96/wWlzTvQfLX1T0e1L
	IwX2gESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW2i-000000040Oq-0BJY;
	Mon, 23 Nov 2026 15:33:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW2g-000000040OH-37kp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:33:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id E3C9A622AF;
	Mon, 23 Nov 2026 15:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A4A931F01579;
	Mon, 23 Nov 2026 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447997;
	bh=LTw5++e2w+iexPjIRtRx5h43jD4fgvwWeeA/d7rdnwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xb2TsqU5YYSD3jZjrnJrtsCsRy/v4kKm9OuiUBjCOIICg1zfa0qLJLc9D7Rp3+0Pq
	 0xyHyCaRDMuAC5RW9qLMH6Am9MtlGjOmfZwOFD8yBXrQiTlDFX0uifeMTb2i/Eziox
	 fg3xYcuv5EmgQ/Qi7dkkCrC6rUApm0aBi100EMATlOHtankVSSrc/OcNSGvcH3Rnud
	 B4bAxRRIiPqYiqEdjvjpTIuKTeMrTahXa15wZAD914BNW4s3Dy8PHkj3qrVX2AnUmc
	 Akon25eAKRtGMhIthecrRwodFVNCrZHGlvaAg53qcq2DHk1YapdiZUMaEaL0k8hCFA
	 xn0OLAOuwyHlg==
Date: Mon, 23 Nov 2026 16:33:14 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/4] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
Message-ID: <4yshvsbpon3tzq4ujrtls5jd6usnbn4m7udlsx437hnqzkqyhs@kxcn72solzax>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
 <20261120-qce-fix-self-tests-v12-2-b5a2a44bc5ae@oss.qualcomm.com>
 <7818fa09-8f9c-4d42-b746-0ec74ee1aa08@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7818fa09-8f9c-4d42-b746-0ec74ee1aa08@kernel.org>
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

On Sat, Nov 21, 2026 at 12:32:34PM +0100, Krzysztof Kozlowski wrote:
> On 20/11/2026 20:34, Bartosz Golaszewski wrote:
> > Add the core driver for the Qualcomm crypto engine. Its task is to bind
> > to the qce DT node, set up runtime PM for interconnect down-scaling and
> > register the auxiliary device using the crypto offloader driver.
> 
> I dislike the "core driver" in the commit msg and subject. It suggests
> there is some core feature or core stuff, but that's not true. You are
> adding STUB driver only to handle Linux RPM things (which have impact on
> interconnects, of course).
> 
> The Kconfig has it nicely explained, but here I see it as confusing.
> 

It's not really a stub. It's more like an MFD core driver. Currently it
only spawns a single aux device but we'll introduce a second sub-driver
with Sumit soonish. I think naming it "core" actually makes sense.

> > 
> > Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> > Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/Kconfig    | 11 ++++++
> >  drivers/soc/qcom/Makefile   |  1 +
> >  drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 104 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index 535c8619197b3e889e536da072ab89d3bb729804..67d54d5211ff21bae77cd8408fa47af630060949 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -121,6 +121,17 @@ config QCOM_PMIC_GLINK
> >  	  Say yes here to support USB-C and battery status on modern Qualcomm
> >  	  platforms.
> >  
> 
> ...
> 
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
> > +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> 
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.
>

Sure, thanks.

Bartosz

