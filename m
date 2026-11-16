Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1A1606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zrxfub2T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MLsQ4pQl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cyZsCPwtbniIDBkRaPuYpe/LAcmExCl9+Rd8iPPLdxw=; b=zrxfub2ThgWsbb
	L7FalUulCEw8WCd3jHaRgC/D96CJci4WvEvqVdmlhMCJtSCniUmOS7fbGwqflse/GYbZonYFIzUWd
	GDiQR6hsXtBCcyPxV7HZechrw+mVolhfWEyflYLvBq73lZI8yFV2M5gubJaR1eOh8OqffO+c+WnqQ
	YH449Y2L8HEGhiLRTVnrrQo3psoF40qLN12eMY27mqEk/6EQartGxNMdQipZr/cRGtAzkvMJgSmgM
	geLmW3upklcWkEWYpqSzJpp0bwVNwHtugw+MpB15Y/pQz2rIW3bs6O68rFpCCW7FayTXKoKIqLtal
	5ztP7Qo97KBYHSW93RdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1cL-00000003cSu-2ZJ6;
	Mon, 16 Nov 2026 18:39:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1cK-00000003cSk-0mqT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:39:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B84C843452;
	Mon, 16 Nov 2026 18:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D86B1F000C9;
	Mon, 16 Nov 2026 18:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794854387;
	bh=cyZsCPwtbniIDBkRaPuYpe/LAcmExCl9+Rd8iPPLdxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MLsQ4pQlsfFTJdBlfPtV344Oyujcb9whxsNgOTB6cQtYnZfCzDCam6FT9VLJ06p0d
	 Fb7CYsGA7kq6UWA17YUTF04RWVepcLLXilWLpkPQdwLRfwH13/G9ILOSKvgKkol3u7
	 l1MOReT0Zc9kYkcCaOXJ9TJUopbWqcRdiShXlTd5CyNWlWjpjtwCOvnnfIeNU65FQJ
	 VJNmSXhc7YTuQBbe4/JAkTGKe4lLfrWeIgGRCUxKEIg3C+6SwvRYZJrH4v31JRDSAT
	 HBBxPYFJnoz7ihjcUKsv41dcLiDnj8wPsWbkOLF5R892GGGw8XC8FK+1qMo8yaL/yX
	 x3v2Y8VkVs6Gg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2] firmware: arm: Group interface drivers under arm/
Date: Mon, 16 Nov 2026 18:39:38 +0000
Message-ID: <179485423737.1197045.4739560170422975197.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106115046.62344-1-sudeep.holla@kernel.org>
References: <20261106115046.62344-1-sudeep.holla@kernel.org>
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

On Fri, 06 Nov 2026 11:50:45 +0000, Sudeep Holla wrote:
> Arm firmware interface drivers currently live directly under
> drivers/firmware/. Some use an arm_ prefix while others use generic
> names. More Arm firmware interface drivers, such as:
> 
> 1. Live Firmware Activation (LFA) [1]
> 2. Firmware Interfaces for Realm Management Extension (FIRME) [2]
> 
> [...]

Applied to sudeep.holla/linux (for-next/arm_fw/updates), thanks!

[1/1] firmware: arm: Group interface drivers under arm/
      https://git.kernel.org/sudeep.holla/c/49c49ca0c4d0
-- 
Regards,
Sudeep


