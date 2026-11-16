Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074E5606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tIvUB2sa;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=CjC+uwo8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MLeOwJjv+/uluOjkQHQQ89/FgHix7fE7jGoDf7goFoA=; b=tIvUB2saFYZTOS
	eemFWPHQgHkB9UhvTL2Bppn3EiGKs1XH5ln6f7Ek4JwVGF0mt71a1vqiiWMfdhenFyZG7sd0cspXL
	rXgRIQCm5vAO7bFbiPmQ/Gz3MtMAoPa9vq7i1txSwqa8KDLiyg+wumh5E9bmnUUs4EzpNJ91XRh2l
	DoZuAGR5seGXxRxck6CZtqR9DaadUZHKfps8Enha+8M+1rsIDCwBjc7/6aNHK+GkapTm+Qu/bTpJj
	NcO1KOM5M7wv9MIkO0M/uAeiPVYV6kgD9jzTprdvhFXxcJHQ41+PeC+ZRAa9RUAGdv0dlvbYD5YHY
	aGuXfbEW5eV/ZJXESjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt4M-00000001mcb-1Kf9;
	Mon, 16 Nov 2026 09:32:10 +0000
Received: from mail-m12894.netease.com ([103.209.128.94])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSt4J-00000001maU-2iCX;
	Mon, 16 Nov 2026 09:32:09 +0000
Received: from [172.16.12.90] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54d4748f7;
	Mon, 16 Nov 2026 17:31:54 +0800 (GMT+08:00)
Message-ID: <9f3252b6-7f60-449b-bd69-23edf2616f04@rock-chips.com>
Date: Mon, 16 Nov 2026 17:31:53 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add two reviewers to the Rockchip DRM entry
To: Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, hjc@rock-chips.com, andyshrk@163.com,
 damon.ding@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
References: <20261110101554.1809467-1-heiko@sntech.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261110101554.1809467-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e3b2e68103a7kunmaed757ed40d12b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ0NIS1ZNSh8fSh4fTR
	5DHUhWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=CjC+uwo8Rwy8hZKTdryKZwzTX989KQ+E8N+m7SaMIJ0k5PL53QO3WMYHqSknOPHGDG4g/gcMVelfHxUTqRc1Zv0O4BcJM1wbZd1Hz1+DeyJJjY71L1TDKPOYjjTZ89uko9qgT+s0E5G/wWtIR9ys5LBdfKe8GiuuKInl65BkIGo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=MLeOwJjv+/uluOjkQHQQ89/FgHix7fE7jGoDf7goFoA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_013208_225342_B8A3F2D5 
X-CRM114-Status: GOOD (  10.31  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/2026 6:15 PM, Heiko Stuebner wrote:
> Chaoyi Chen and Damon Ding volunteered to become reviewers for the
> Rockchip DRM drivers, so add them to the MAINTAINERS entry.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..99142a911350 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9139,6 +9139,8 @@ DRM DRIVERS FOR ROCKCHIP
>  M:	Sandy Huang <hjc@rock-chips.com>
>  M:	Heiko Stübner <heiko@sntech.de>
>  M:	Andy Yan <andyshrk@163.com>
> +R:	Chaoyi Chen <chaoyi.chen@rock-chips.com>
> +R:	Damon Ding <damon.ding@rock-chips.com>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi


