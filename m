Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F97606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rBZ/aW5L;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=H1br0SrU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Nf+u8uDdBeb8sz6+AsPwZUYSErJxQM3b+PCxFlU5aJc=; b=rBZ/aW5Ldp07a9
	X2/OsGiojB73FCDo02H+2D56CZPRKeagFsWkuqWNfA72DZNzuyj7DiEfzdXEltEkqSoc4xVunmAAo
	/Y1EoFr0skXEbNc2DFA4UyYAqrY1/Rwwk62DBbU3wgBuXmHvmwCQpEmid9sjEo3osF4Vau035bmM/
	YRLUtOpxOZFs05oiseq1/mG51y6Oa0lfkno+5g9T3BiY51km3JrUUyIfcKEsDd+eOg14cVccaeiTb
	i47FTiuY5NsjmIVaEiBFnI50HF8pvC+S7Q3Bg3KhGo8puZHhLIZBtUUpR3+UagRNVWqMBXvw13lNU
	fdm4HtG02NGrnCgDU8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4P8-0000000FFJE-1g3c;
	Sat, 14 Nov 2026 03:26:14 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4P5-0000000FFHl-2jan
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:26:13 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cc147d86bebso885353a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626771; x=1795231571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nf+u8uDdBeb8sz6+AsPwZUYSErJxQM3b+PCxFlU5aJc=;
        b=pDmc4g7TorW9nD0a9WVCWQw68ZwIBrBUNdlyjE7ZIT8KHJ36wpIiS5q64yFLaofrmR
         cc+ZIych5U1GwS41Oo8eZYq+RrLHlGTKmcrSzA4WCL5BKlYvCXlAIPwK4nDlcDJHkQ9v
         +epzqnJ4zWHr6vdXCs7hXyw2XLe0NxXTVmFkLdITOAR2lJLK6m7F1zF0ZnYHvpDpreFY
         iHvDf05qBWYrPB7WEeKmnp3VNsyRx5qaAjynNYWLFjTY73HnMqcCCnHbHs5CoQBi2+E/
         bAl0pyf+8ZYNm/1I+aruiwMUlDBdXoRK+MVtjuub1vIS2VSezR7cJVBoU7jNFrtcdrya
         NGjw==
X-Forwarded-Encrypted: i=1; AL+hErF4Q1TZoBdBNx2RqUl1n3fU2BfCw0Qg9TOvvgym0whLjjXlkh5aHv/r/CndId3VGznXz4/eQQN7BxkpsFkiAKXx@lists.infradead.org
X-Gm-Message-State: APuU4Z8aWn/wK93JwgCTjBEgioiZE9rx5gWLaFKpcsBmvnFwK5F0YcFd
	ifnaLpuM1BQ+YtGt7/0ilhDsDr/M0HwKU7evWoB/5YG88Axzug2+bd1WwZYtQiLjWypROFXPRUD
	AwxE7aJQ5WQmDprEveD1iYO9ErQ7NS+exVYKN7SF89KdvOHD56121Qw6BRXQDZZGSIrXZ6/Qh68
	Qimmtp6FrVwnaPGaYmDTvZV/I6nI8GcUg8TB49wYHOtzLQTpkGfQ1Tz+ps93TXsVtSVBiWDRjw3
	zVgzSaQ2xGZbMm0Fgu12scK1FLRZ/SDqHM=
X-Gm-Gg: AYBFou2wnSV5/IOunRCf3Kx+Ec6yaADI1i2OPzeLsUIyz3GfjzmIWn3l+oMpDnGv7Lb
	6EDpvo80l2B0de7aNIySV+Gzc9c6WKKJ0tG1GXXAkygcJdjyNahZlXe8HZ007ETUVn+CTG3Ft7p
	+GseOrFRDH+5hxqNwRH3CU0f6bzyFEXNuXdYqh0zAXreTlBl4p7p1aIfjUnDW99Yc1JVn9/aFyH
	xAeRW4TocSiOa28ayuel9d91EfhTCoCEe7K0apUo7x9qnsE5w5yrk0Oz2ZjzkKN9kIBSqf0ADyw
	/hthCyi19JS+3yTaK2DjL4H2WsgwKCfFGXpNUENSXspL/Vvz7gNRt0d7NMNDe6qOPE0KhxgxpeB
	zGKWsEpBBRCpY6fFpajiG2o0XWwG39GZp5sqhaxqjVEwmkMiKPGibtoxieEsGZz7r/HzG6FEkKN
	D3nO3641URg21oSjeSwTBCVGAyzGd4CGCsSyvXa45T
X-Received: by 2002:a17:90b:54c5:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b1b087b75emr2766727a91.3.1794626770582;
        Fri, 13 Nov 2026 19:26:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdc76asm9114022a91.7.2026.11.13.19.26.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37158b53d06so1426630eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626769; x=1795231569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf+u8uDdBeb8sz6+AsPwZUYSErJxQM3b+PCxFlU5aJc=;
        b=H1br0SrU5+Q0ZUtSTEkNiClDflkei3uAQrp3O2DHOs9JmeZZzqpgG6ODxEvb7/gtbg
         dtmzEKzyyjQHPl2xvmM7+UxMBNMOSkWLsstarVr6yj8tsXuC0vRJCIQOwOCbiamjxVKJ
         4ZjCGUCkQob6cn2bI/y0IM1fBVj8N59qb1QWE=
X-Forwarded-Encrypted: i=1; AL+hErGzNiBFJwQXyxiqgB2ZXWkoVTt4nFpGMJm/Ypu8a/wlMImBjDpSaWcmBuhPghiYk06kdAL6O/8RTj7LnIPK/VNB@lists.infradead.org
X-Received: by 2002:a05:7022:e881:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1b4f5dbddb6mr7061005c88.0.1794626768585;
        Fri, 13 Nov 2026 19:26:08 -0800 (PST)
X-Received: by 2002:a05:7022:e881:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1b4f5dbddb6mr7060975c88.0.1794626767910;
        Fri, 13 Nov 2026 19:26:07 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm14219770eec.27.2026.11.13.19.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:07 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v5 07/11] platform/raspberrypi: vchiq-mmal: Include missing headers
Date: Fri, 13 Nov 2026 19:26:05 -0800
Message-ID: <20261114032606.873673-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-7-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-7-d25e3b687e71@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192611_694994_466D83BE 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Nov 2026 16:48:05 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> The structures defined in mmal-common.h use types related to lists and
> videobuf2 framework, but are missing the explicit includes for them.
> Include those.
> 
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

