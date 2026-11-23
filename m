Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5E1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NdUjiQI5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JC5MyreK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XReu0ZKCor2qvQSwwYtS2+JUKrtwYf/w6vLmesHfbts=; b=NdUjiQI5cwDSFmBf/X1o2Dui8G
	NA5uPGOMv7DQI1c8QS0nqWMZWzy+zg9ZHWozWykZNAqpm264x8brP4e+VjBMHaNhHNFl8ASTx2sn4
	fHa8KTLcE4RO7YdrA4/9+kIVSRIWaiKqnagJuq7WlZaO9B3xslsHlWDVWlg04nRNU0daCjGSnQUJ0
	3ix5jzoF99w00FkQyVeyX2C8Sb41d+u+DJuP3RoLUJoiWn438nVve4sKbRFfBzoVgaT/wWGm2yzeZ
	I92KprLNAsAoEFZrZgnCFPKpORDBdOoUZwJk9L4mUfv4SC7wXQ3WaCEb23kfqB/RdvQEYGESLdKLd
	gX6Pn2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWNa-000000045bj-0kkB;
	Mon, 23 Nov 2026 15:54:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWNZ-000000045bK-0DDb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:54:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 6FE4E41ED4;
	Mon, 23 Nov 2026 15:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 64F841F000D3;
	Mon, 23 Nov 2026 15:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449292;
	bh=XReu0ZKCor2qvQSwwYtS2+JUKrtwYf/w6vLmesHfbts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JC5MyreK4jS05VjTpRFCWKkJ2PA9aUITrHSukD14GcvyDU9FEEVh9HSwzNqg9mOwH
	 EMqUNYnSWWZiZKxeC8DloK/0Bzk4bzR/YmmgcdyWLuNtCdx05YiJ3/EkyL2xTOVbPH
	 HZISquup7m06NFho+uW62tBi5DaxA0HY1OU+gq0Qo1FeGe0/3zJq2BgSWIGR8Xg2CQ
	 p+sDuhK6RV0SPA4P8NeF8qUxk22oY0CQf3pHKG19Rexna4s0FGtcjHKeytHKLxST7S
	 oTjzNDILA+pPNLpFtsS/Ng7sJVk4ZkbVtlYNIHfaASAhLhggdotLwEIETTtnzoY727
	 FAOzpqedyhF1w==
Date: Mon, 23 Nov 2026 16:54:48 +0100
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
	linux-arm-kernel@lists.infradead.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v12 1/4] crypto: qce - convert to auxiliary bus
Message-ID: <6p6pyrwbf5de3ftiq2dlzbf4lvuzgmyi3p6hd7gtodgckzceae@5rdpvien5bch>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
 <20261120-qce-fix-self-tests-v12-1-b5a2a44bc5ae@oss.qualcomm.com>
 <c26b8002-c246-45cb-bca0-8f596a2a425b@kernel.org>
 <sfsgrwaj6ichkuafqvrpmql67664x6vyxgz7lwjxhywbf5zc3l@edz4qooziklt>
 <755ed314-ac9a-45f4-9403-52e7f0754ca1@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <755ed314-ac9a-45f4-9403-52e7f0754ca1@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 04:40:15PM +0100, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:29, Bartosz Golaszewski wrote:
> > On Sat, Nov 21, 2026 at 02:05:57PM +0100, Krzysztof Kozlowski wrote:
> >> On 20/11/2026 20:34, Bartosz Golaszewski wrote:
> >>> This driver is disabled in arm64 defconfig but one of its
> >>
> >> That's true for next, but your patch #3 seems to disagree. That's
> >> confusing. Maybe you meant disabled for arm64 platforms or marked as
> >> broken? Because anyway defconfig does not matter here - even if drivers
> >> are not enabled in defconfig (so stay disabled), they should not be
> >> affected with unbisectable changes.
> >>
> > 
> > Keeping this fully bisectable (it is build-time bisectable actually)
> > would mean squashing all 4 patches together. If nobody objects, I can do
> > this of course.
> 
> That's not the point. The message is just confusing. It is not "disabled
> in arm64 defconfig" according to your next patch...
>

Yes, that part is wrong but you also mention retaining bisectability in
that paragraph. In linux-next, this driver is enabled again and the
BROKEN label dropped. Do you prefer a single patch splitting the driver
AND updating defconfigs or keeping this as a series?

Bart

