Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2B0606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X6HUe3B3;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HMJ54CAv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i/gP54SVVmklviolBdcVwwsQRp3di1qTxKaCeiKcwAg=; b=X6HUe3B3UO0Lu6
	bqROXLVe7FzhH2nkm5tVew64Bi0NOUsioEgT02I6yqQQpVpfseA6JccyuCgLQ0SLIpmWO0ZMr1a79
	/GTvg6aGOW4R02JEDiQyqcmghbUD8zcV/Rb4hDnkWL7A2luv6And2IoMdHiubS5V8V1caI6eVsewJ
	yplMnYhlpVUf52zn10p+eIvuEZE54nM1p8ZCSvFU5qJluvi7PxawvLEO1WlNZU/nyiNTJqpk4uV6G
	35WoQ2LVF7iQbd7kAzQrzllBU9/eWJkGSn4bocA6QeBs9q4btIKy6b6914P0VfT8u9SXG61G4oEH6
	ejI75XgbMQFd96jFnWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5hy-000000045r1-47zu;
	Mon, 16 Nov 2026 23:01:54 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5hh-000000045kZ-02uz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:01:39 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso365441a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870096; x=1795474896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/gP54SVVmklviolBdcVwwsQRp3di1qTxKaCeiKcwAg=;
        b=l3v0q2M6edVqjR9ggFy1FLSggzACNSGGe+1WF2Wqr1wLDADXqCa2VVqOrX5oGCoIOP
         mm6FiWPxcHgTrSQKDDvTqh/vThhZT5XarDJaA242CS10kwv24wOYlUgi+NW7LWWOrwXI
         rugTb4lGbjsXMPiz+68CzGQzum2miKO/eC9rm51yVjmhV7S31pi2gljS85I81xFVoOfa
         dak8FWQjsonEqq6vjAEiVVJ7HcBLN86K+MycPFgBnkyR8Q3bRkqwqAGe9woXxj+lyTuT
         6n3mhuwElaI868k2SuNeQpe+PP8iRsJHOj51Z0Cp9IsIWbpm+bx9AAartxX/JLLUO8s/
         1hWA==
X-Forwarded-Encrypted: i=1; AL+hErGqTJfWd/ycMygX9sqJEKgu6BqiLazjwa4/6MMnxUnzVU5cyW6nyc7ARABvgwOoG47KU+++BUmQOvRRyD+Cb1Gr@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZdJ6JesIolFZpMO/n2FK68oX64UobG5Cn6aLpwCIes7WvZbEw
	SqIHOBJs+5v5JJS+r6xMo1K7S5kGZ2TVuPmSY+5m5HbBF8GhXZhc0fFCsjk/05ckNlhOu0WKaj/
	Tp9QJdCgAQWcLUBk7okFnFcfbbBsLVYL/T5M40baMeju74UXOkrBtQXQdS9z/PiB5ptfNovMr9T
	aApYYWzoBjLmHxTPFPte1g0yEo9qXmVf7YwilshO/X0H5fQ9FVyYYQ8S4Umpp2h4o3WdzEIBnnv
	K5X5X2Usi8DS36bR5xwBp9lVJJpTM/ZSCw=
X-Gm-Gg: AZFdTZf0rmxXiKv/i3j1v9YR701wqZrWZw5O+bN+Taowi4l50Janh8PbWDUg0DyeQKe
	dv/cLUCRiqsax1OOQmVf5F3RfiJDVhAEMMcyjlfhyb4VMXljLKUJbRCv7CQYhLeiCERfpmQgRYy
	lTq5Hck5tDzwKYaamh4B68OkuNIJ1ZQFOXLihBS3FFoM5XpaJMiqwAgGF8ZAyDI3pQC/M122tK3
	O3hxd7yqhwDmZULTwyrIdv4LoHXDxitXcw07cReR+irn/uh/HMyR//8eZmDT29vF31jpQPakk6q
	J44dVW+tU23LHm58UogCMD9uqHPrq/QFHd5vwveR2WqjV/pm6OPLIlLz6KXGklxW7Jeg8QAg4ja
	DQgeWei6RtAdymwxIS6NU7vzkoFWXbTv+yWwfFt5V0wP+TaqthgApympVwbaG9EDqarzZB1fx15
	U7FGy3E5Z8FDvODF1dr5UF8pTf2U5fsKD3aRylljub
X-Received: by 2002:a17:90b:3806:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3b1b0b53ad8mr10650776a91.50.1794870095833;
        Mon, 16 Nov 2026 15:01:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b1ed0b73sm6386967a91.0.2026.11.16.15.01.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:01:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2696623b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870093; x=1795474893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/gP54SVVmklviolBdcVwwsQRp3di1qTxKaCeiKcwAg=;
        b=HMJ54CAvAGylicW62n+dqIJ8wLSNu79fbUpkkg+tsuGXhJkTy/sNocqydtwEJKsbQW
         L0wmszR+d4MS9ogakkZd1SUWg/ju2VchS5fGxt+pvmuGrEPN4+LaOQAA7phT9wB9b2No
         6IHnkx4jHRs0gtQizp6uldpDLbk/puHqb5ow0=
X-Forwarded-Encrypted: i=1; AL+hErEBHvS9cxojELYI1QiuVQiDvaQgm/BaV2jtXzeeBDBeKYhaJkpKS6zKY9mEeCwUlp8D1/bEszZ6vKcJHuzp62J8@lists.infradead.org
X-Received: by 2002:a05:6a00:909e:b0:874:705d:f640 with SMTP id d2e1a72fcca58-8beb677f05fmr8399725b3a.34.1794870092571;
        Mon, 16 Nov 2026 15:01:32 -0800 (PST)
X-Received: by 2002:a05:6a00:909e:b0:874:705d:f640 with SMTP id d2e1a72fcca58-8beb677f05fmr8399694b3a.34.1794870091919;
        Mon, 16 Nov 2026 15:01:31 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2635285sm4446499b3a.44.2026.11.16.15.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:01:31 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dom Cobley <popcornmix@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] platform/raspberrypi: vc-sm-cma: Fix get_kernel_id check, pass NULL for pointer
Date: Mon, 16 Nov 2026 15:01:29 -0800
Message-ID: <20261116230129.1469941-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116-vc-sm-cma-fix-v1-1-2b0f11aa96b9@ideasonboard.com>
References: <20261116-vc-sm-cma-fix-v1-0-2b0f11aa96b9@ideasonboard.com> <20261116-vc-sm-cma-fix-v1-1-2b0f11aa96b9@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150137_064813_9169E326 
X-CRM114-Status: GOOD (  14.13  )
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

On Mon, 16 Nov 2026 19:02:53 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Fix a couple of issues reported by sparse on the vc-sm-cma driver.
> 
> The first is around the retval of get_kernel_id(), which we check for
> negative error codes after assigning it to a u32 value. Fix it by using
> a temporary signed integer for the check. While at it, also ensure
> during error handling that we call free_kernel_id() only if we got a
> valid one earlier.
> 
> The second is a minor warning around passing 0 instead of NULL for a
> pointer argument.
> 
> Fixes: 0d6409fd70af ("platform/raspberrypi: Add VideoCore shared memory support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611141042.Rxt6cuNo-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202611141002.jCrJ06DU-lkp@intel.com/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

