Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AB9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V4BNkZ1z;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjQioaSI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b4p9wV2tpTy8te3nY3YNbgd551xiWngtyJF9zg8GUbI=; b=V4BNkZ1zsGkQIF
	BNpqIzjAGsu7gSNSJM3HBTKslbYORx53/QuiuGxIl25FlqejFQRahqSjLsM4zdnIAw8OiuXlmhXN9
	gDCHO6B259AfmxLPlTEQ/16LHYigcNUGXxHONDyKCBEHY2qRZGpf86rH7C3/jen0S0te1jbowcwhn
	CXuY4JddjL7DlfeAm1pddpGHkIEwR42h7QvqShJBV4FcVFazVJXlRLSQm8dBlhYrkAYeyDcnrYj9k
	JAfbaghFPUx5dJuLnNqWJoS7VdX8VzpznVQYrk4ooCiORlgozEfh78sr6DpMob71UXoHmTg1UVc0Y
	0I+teAsJBQM/r3Lu0aDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZ3T-0000000HUZn-1Vr8;
	Sun, 15 Nov 2026 12:09:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZ3R-0000000HUZ6-0Xl5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 12:09:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CA8E41790;
	Sun, 15 Nov 2026 12:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F731F000C4;
	Sun, 15 Nov 2026 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744592;
	bh=b4p9wV2tpTy8te3nY3YNbgd551xiWngtyJF9zg8GUbI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kjQioaSIpqKriLrPr7CHHViM9z1V9W+JXYEgp/R4VvntcOwHi2zZLaxf1BI8JFVhQ
	 gu53ZmMEWBAogezb8DCRimozgXN8fyiYkdvz9JuuFA5a/ks2bh4FceKOFtNzGpqfrH
	 /6mQqdNbko4VpJtpDzX5XE+y3xDZ4kssbxFsxqyTIaaKHVPdSUVZG8uor+lur1zzXQ
	 7doWLP7VOu8a965Sd2nFww/c6d5cASvz99EDRgBCWbQ72c7txgQz4g61ytcVgrp11k
	 2f4d3ucSinmZAARo+zBaycMvE+BJkpLISrATCs21yp/bsCuydefsjzJwaFBMe15mTR
	 gJxwKhsm8dymg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, bmasney+clk@redhat.com, 
 jbrunet+clk@baylibre.com, sboyd@kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 0/8] drm/sun4i: update DE33 support
Message-Id: <179474458919.3130971.11295267069000925576.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 20:09:49 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sun, 15 Nov 2026 07:10:54 +0100, Jernej Skrabec wrote:
> This is second series out of tree which aims at properly introducing
> support for H616 Display Engine 3.3. Previous series [1] reorganized
> driver so proper DE33 support can be easily implemented.
> 
> H616 DE33 support was actually introduced a while back, but it was done
> without fully understanding hardware design. Issue with existing binding
> is that it considers planes as resource which is hardwired to each mixer
> as it was done on older Display Engine generations (DE3 and lower). That
> is not the case anymore. This series introduces new driver for planes
> management, which allows doing proper plane assignments.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
      https://git.kernel.org/sunxi/linux/c/c6d21e8bb03e
[2/8] clk: sunxi-ng: de2: Export register regmap for DE33
      https://git.kernel.org/sunxi/linux/c/63a29fbb4ecd

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


