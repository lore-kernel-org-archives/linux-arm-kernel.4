Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B3606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m1rv0PX4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3WHPGu8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dAUG9itb1DceZsbgfGeIfItJJItPj5Pk5T2lDscbORM=; b=m1rv0PX4Blj+Sy
	mrgkUnaiRLzddtgJvuhGHbFRFLlsxOoxfF5Jn2C7dnPHAdqxwnwfAwRsPfy5QiD/9AS/vRZxlskG1
	332tpjVUpCqSsZ2UFaUdfohvNFja5N0XLlX8kjTtLMemJGlVF5WOTtKJRwpE8GIHl9VNbuDboj88P
	fQmlvc1qiX00d+JJibIP8zy/6JrJksyq418xhPGyfZzNj1g1MGAscMx0ux4vGRopekgkDgz+mMoqI
	KNtdZ35I/47rh+IRikgZg9bxAvScznNkbkaQMcXH3ZU68/XIeudV0Vm7FwYJs/hsDBo9upBlFhWQs
	txG1lQylNYxCmI3chB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbRA-000000005f7-0qio;
	Sun, 15 Nov 2026 14:42:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSbR9-000000005f1-0Paj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:42:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15E026242A;
	Sun, 15 Nov 2026 14:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8969E1F000C4;
	Sun, 15 Nov 2026 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794753749;
	bh=dAUG9itb1DceZsbgfGeIfItJJItPj5Pk5T2lDscbORM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e3WHPGu8uCEixn7WZ5MdPvpjjsenLQwhcdinvIpUi/EM8Mqs3j0lImHKfMEDN9H2J
	 Td05ACPL6A3FSnHLoSj/4tdTM52SEqkFjyZTZ6Zr8IQqlPE2/DDNYJA+9HYtzoIUlD
	 jHLkhOKhH6vORFt/DpWu08DPJvC7nZtJM4Yyhcc82iMdSB1BJoARJhcM6a2/vjlHjr
	 TRTdQ3dILRNix6CxFeIfLRyMiHtvrmw5dlhhLgnqacSm4l/qJXsOaSirSEsh7+St3G
	 /iYcVwLoxFWLgEL63jpuikWPdjNDt7hi9n/hBH948Q9vxVrn3eHl7sCZQ9squo67zI
	 HkbC4T1l4mvyg==
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
Message-Id: <179475374632.3212936.18354501331414111023.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 22:42:26 +0800
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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

Applied to drm-misc-next in drm-misc, thanks!

[3/8] drm/sun4i: Add support for DE33 CSC
      commit: ea008133ef8078934a0dc2924a8263d645f0ee1c
[4/8] drm/sun4i: vi_layer: Limit formats for DE33
      commit: b1ba050890684fc7615fe4c7d523f4f46c1696b1

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


