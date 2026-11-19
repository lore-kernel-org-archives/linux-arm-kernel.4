Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48AA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t3BhAdm5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abDR0zbs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aHFq3ZmMqEintar3TVnNYXZWAKktvqMww4jJI+tquW8=; b=t3BhAdm5aAn6iK
	pdpcoTy1F0Ft0AzjuB61K+JTXFLCgTIyVuXiJkFcFt0utcSx6fZQ7mYme8Xo6fJ/8rmmh+BL3F/Wc
	zlIsGmKZCI1FQbUafWB44Af/LbdeTLnxPbVjeYVn/xRY36VbAAZfxEKFnvihaME8CcffqC5E0ygCP
	I1OZww70F8CMgj/tj9SL4SUz4+En34b+IF1lQ4s1cY0dy2zXXcPfY+w24cbPBy3S/HUp4160Qf8aB
	kSH0AIjkqs4GzmjudzwoFCB18b7aHpKRiOkZ0NiltOxz6umAmouVfquQ0jzFytQ9QONMheTN05Kp6
	7V8kM9EIWt4tk55698ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1qa-0000000BzI0-0cdo;
	Thu, 19 Nov 2026 13:06:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1qY-0000000BzGu-0JHi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:06:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADFAB6181B;
	Thu, 19 Nov 2026 13:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4788F1F000C8;
	Thu, 19 Nov 2026 13:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795093595;
	bh=aHFq3ZmMqEintar3TVnNYXZWAKktvqMww4jJI+tquW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=abDR0zbsIXjkQ1Vstl4DTsreiE5F4NwPklexVLJeZDs7FJvKIAu6wKJaTvetlfeB4
	 1OmgD8DRmZpBdEzOFQsRVLT+Va8yGeRpM9xTSJXYG9RU5I+Zm74IZJ+3u+MavAnMH8
	 VTMGjR7tsOT38D1DFRgvrQhtNWpdjUuq2mSzE3USwiyq0jwj4C28jk7fPEW9DWVFi9
	 Row/Ivv7cOa8pQ6TOJQ0DoyAJSFwDZ8CcLX7P3U+rL+wU7GHc6ip4xLnCNj7W6JziU
	 yHp6OBh4KI/5FIAEx/6romBhAYdi8AsnSgxZ7cEwP15GQRJNicGiSujthXEjJ3Bu5J
	 HXf3roCaFsvYA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: arm: smccc: Mark smccc_soc_id_{version,revision} as static
Date: Thu, 19 Nov 2026 13:06:31 +0000
Message-ID: <179509357050.1241471.7097540409198782059.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112180543.45606-1-sudeep.holla@kernel.org>
References: <20261112180543.45606-1-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 18:05:43 +0000, Sudeep Holla wrote:
> Sparse warns:
> 
>  | drivers/firmware/arm/smccc/smccc.c:21:21: sparse: sparse: symbol
>  |		'smccc_soc_id_version' was not declared. Should it be static?
>  | drivers/firmware/arm/smccc/smccc.c:22:21: sparse: sparse: symbol
>  |		'smccc_soc_id_revision' was not declared. Should it be static?
> 
> [...]

Applied to sudeep.holla/linux (for-next/arm_fw/updates), thanks!

[1/1] firmware: arm: smccc: Mark smccc_soc_id_{version,revision} as static
      https://git.kernel.org/sudeep.holla/c/4a80045a92bb
-- 
Regards,
Sudeep


