Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6797606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cAVRLAh3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pxbj5a91
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TOLD2CPZvx52MaoN+C1pdm93hX1HRaynp8h1iqcwmCs=; b=cAVRLAh3jjWQow
	xWoNv53dHGFgfNZ9FMPboM6nzlc/08tdDtQpDeMI+wspXwhFAih3bw+9XOkr10oZsd6fxkNPmWUMX
	nlrrrb62auemOacJtmeyMeA8Z6zFcoYkJEaaUgzGGoKLUF4t6Z+13b4yko8rIYi7OudT7hqvGSLJu
	ihrjuiBSgvBvJP3NbW7i4xClHN/6QcFXbNBJDL1d9NZJBFTsuixx8TUT2IJWpT6NbhHpkXWyoJYhG
	AjBlF+eSWPBo3t72m/jEXfeayteRu0194mphHaNcdrRLzQs+k0m/6GCzWerEeABqv+APYDSLm7oYp
	+3F/yrPzl1sjWdLH3U9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nV-0000000BxJn-027U;
	Thu, 19 Nov 2026 13:03:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nT-0000000BxIe-2woB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:03:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D07C466E2;
	Thu, 19 Nov 2026 13:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059B01F000C4;
	Thu, 19 Nov 2026 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795093407;
	bh=TOLD2CPZvx52MaoN+C1pdm93hX1HRaynp8h1iqcwmCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pxbj5a91BAO8ua64eJPyq8dIMeylt4Ro8TPDRxAZtYHS7NX+xTjbT+OXbAZjsRnK9
	 pzKRWxclJNtaWcnFxHbloL5iTgWUiAOqYtuH3ifQE2OF8TLPneYM/vPRftyc5xX3Uv
	 k4KsyXUosSANAsu+vlREwTuCgNVXdDEEK5DB108RRlqpHb2THBlBlb9A8dtneGrwDo
	 t2QTfdGri3kbJ7//TVHA8xTR2YNBJ3Y3CZrWmz8jB0v/pe7MHvYXy8b+ZNazTcgVaj
	 zefPo34vS2XpBY7PZzVUCvJr3mz4bF25/BEjC9ayfkwvqdHOzwwlubwINaoHstx6v7
	 Rq4FUENX9cWVg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: arm: psci: Fix unused variable warning
Date: Thu, 19 Nov 2026 13:03:20 +0000
Message-ID: <179509334525.1239540.9021747081727812155.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112180524.45550-1-sudeep.holla@kernel.org>
References: <20261112180524.45550-1-sudeep.holla@kernel.org>
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

On Thu, 12 Nov 2026 18:05:24 +0000, Sudeep Holla wrote:
> Clang 23 and above complains with the below warning while building psci.c:
> 
>  | drivers/firmware/arm/psci/psci.c:81:13: warning: variable
>  |     'psci_system_off2_hibernate_supported' set but not used [-Wunused-but-set-global]
>  |     81 | static bool psci_system_off2_hibernate_supported;
>  |        |             ^
>  |  1 warning generated.
> 
> [...]

Applied to sudeep.holla/linux (for-linux-next), thanks!

[1/1] firmware: arm: psci: Fix unused variable warning
      https://git.kernel.org/sudeep.holla/c/9cc33d1ca1dc
-- 
Regards,
Sudeep


