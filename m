Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA5A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hEX2kPvk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmD2x3x6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0CJqhfaRwIf9n/RB1oADTEsSvNdb2w12OyIuhDSocvo=; b=hEX2kPvkDsAROXlSwmgl/x2M+4
	r6+3qNyDrkOCCmbPZ42g0DnejGLWUrVzhcv4uskX92BO7KWBlv/Fz1W12XQGRa4aMcRrA4HNhe/GZ
	ia5M6dYRoleFIWanWv0pmdMNpGCwbWQWTsCwi/AHjI2cRLYylaITWlFZO7j+TgrZuQ81E0gX4+MQD
	3LDLiXVfQ75Yb8OcSED+j+H6Y3ol5+tO3jYXffOpmLKxS5FxKFsqIAuFsLWbDmlZ24GB9h/CBAibj
	JsO+yqGCn4hfCZd5FihXzTTXA3MywL26LlpHxRQ1ShYqdC1mUuoD4QZWb5WvNMNmtlwnQPXtvKXdX
	BH18f/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULNT-0000000EXkV-3q17;
	Fri, 20 Nov 2026 09:57:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULNS-0000000EXjQ-2B4x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:57:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id B6C71611C2;
	Fri, 20 Nov 2026 09:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BEED51F000C6;
	Fri, 20 Nov 2026 09:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168673;
	bh=0CJqhfaRwIf9n/RB1oADTEsSvNdb2w12OyIuhDSocvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gmD2x3x6PsfNrEh+DSm+x40DYGTO+CoCR5AoiTvgLBZX9ziMreBXgWmWD8WD8lqfh
	 piJw8nIoJxjKiWwlsNZsDiF6WQn2PI2+eTmX7OvdB8+sdOF+v7rDl8QjsobA/88k0V
	 RZrhk3QPPKS7H95/ewdgJ4vM+5RS7twMry/5HvZ2chPMjWQWNENvgUB54LjYrre25e
	 heeayolfYmqvt0kl/3xkCTtw6zWwkBFo9tQCGYfRL6qz6vBFUF+kxrovJFgoAS5zeZ
	 I4vd4ZujYmfJNyjMRAcnokjEbKBpLFPgQJopjLDlgTCMCPJcRYpmS2tLA5Ex2LUC/p
	 jT34Sn5zC0NEw==
Date: Fri, 20 Nov 2026 10:57:46 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Russell King <linux@armlinux.org.uk>, Eric Biggers <ebiggers@kernel.org>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Birk Skyum <birk.skyum@pm.me>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 0/2] crypto - qce: make algos optional and remove the
 BROKEN label
Message-ID: <2bmlzgxt3xtjbrtt6gypvfkji3tvxclnwld2wjjmzef3cdpgfw@cgohz3kfd2wp>
References: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 02:20:07PM +0100, Bartosz Golaszewski wrote:
> This is the follow-up to the three smaller series fixing crypto
> self-tests in the QCE driver. It makes the crypto algorithms opt-in via
> a module parameter and removes the BROKEN label so that the driver is
> built by default.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi Herbert! There are no more sashiko comments on this. Could you please
take it for v7.4?

Thanks,
Bartosz

