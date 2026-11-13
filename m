Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2993606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ib/JY9G+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYlt8ay7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zbkck7rK9ZeAo1XYOdrmCRWw5wC2GxwTnQHKjlo4UCA=; b=Ib/JY9G+LWlSE7
	JoFv648NH1Y+45gF0T0RpripCxm/g+QovT347KBuGR8XaWqXrEvKUbt/VwqUfqhFkTx8Jf+qiffj0
	JF9tuWymHybmi/xFDw1g+bJzQYuXZTMOLEs+/z9dkg7y4K9k1/rkALMFGOldN7G0HCHKfv9KZWWWD
	pWRF+vZvS3Cn5XvZPO+G9HIsAuesOcjvv7VINfzif1K2AGR/3qCA6bKkv+u9sa5UU3hKmvZAHGP6b
	iUa214S4SSfkRNw7V6moVLBurKubfrrTqdYp2qcXr6C+mnjGqYP0l29JsnuMA/Ug8/m6jDZj7lsVU
	nzZFbWWbMbnYbBZLWX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsh8-0000000DGmF-43lr;
	Fri, 13 Nov 2026 14:56:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsh7-0000000DGla-284R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:56:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0337F40711;
	Fri, 13 Nov 2026 14:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F4E1F000C4;
	Fri, 13 Nov 2026 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581760;
	bh=zbkck7rK9ZeAo1XYOdrmCRWw5wC2GxwTnQHKjlo4UCA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PYlt8ay7/f01k+uAtrpNqYuG1hJw+/7LJttkyP9OcoJhqFsQjdDouFWy74sFH4Kmw
	 +v3JSPjXTu8L5t9L/6vLbPR5xwY6kwSjLkzJ1qjh50v//sNp4RcwtxoSTE9jLbba95
	 hEoV5EW0v6d1HLpQWgmW4R09uAG0WoD0WlG9FOUfjA4PPQwLig5FMRf5NIOb4XGlRF
	 MLV89MQJVgkELPF47LPzdjydQ/7v8/L9KmyO52d8bb3+Kg0C9j7nopohNTBTDuzSn+
	 snMiWc9AsHkyNsbFxq2lc/Fx28LQGBjUq77kdmGXRHkkT2BgRq3xRkKbqtDvesbv4J
	 KSK+ANyLaVrRg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Yuvan Shen <yuvanshen09@gmail.com>
Cc: Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261101-upstream-macsmc-key-info-v1-1-fa9ff863d199@gmail.com>
References: <20261101-upstream-macsmc-key-info-v1-1-fa9ff863d199@gmail.com>
Subject: Re: (subset) [PATCH] mfd: macsmc: Hold the lock while reading key
 info
Message-Id: <179458175847.70591.13412979849674221335.b4-ty@b4>
Date: Fri, 13 Nov 2026 14:55:58 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 11:51:58 -0600, Yuvan Shen wrote:
> apple_smc_get_key_info() releases the SMC mutex when apple_smc_cmd()
> returns, and only then copies the reply out of the shared memory buffer.
> A command issued by another thread in between can overwrite the buffer,
> so the key's size, type and flags can come from a different reply. The
> hwmon and power sub-devices call it from their probe functions, while
> the other sub-devices may already be issuing commands.
> 
> [...]

Applied, thanks!

[1/1] mfd: macsmc: Hold the lock while reading key info
      commit: 8734b221c98ea48b16c4d9389183e869b72b0e5f

--
Lee Jones [李琼斯]


