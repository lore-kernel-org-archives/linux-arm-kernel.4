Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FB606A88F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3wzOwcwj;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CyGKAHcY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uQ1xxDHv5qhDKLMrjvd/peKgYhy+qeIMx2uBdiELiF8=; b=3wzOwcwj+sXmDP
	QUL2TqeX6SIB4rxw4LTE05o5LEKELklFo0n7v+s4U0wC+mcbJNjbyC+OjdH5MAF0iGV/t0yBgKRng
	UGSFFhQQMUrdjUakMCU59wesURH5r15gUrgBUVw0O+c8kaZYl07CqMYFEl3ZlyaOWaVlYNiO64Arz
	W4SqCZKO7tFiAB+xieAA8v9KZ3VTVjAGR1kxMSH9acLtK1zwFfIqkcf1NMj24xTP8AkKjroNMxLSg
	kFZDoN4lsExwQ7PoQUrrmEAmJoH+j+xuwMs8HrvOmk2GOcVrt/C0GEaew/aFi9W2x9ObLMIKAYEsT
	zs4nqFkgChf1B77j6Y4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4EN-0000000FDrh-10gM;
	Sat, 14 Nov 2026 03:15:07 +0000
Received: from mail-oo1-xc62.google.com ([2607:f8b0:4864:20::c62])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4EK-0000000FDpM-0DVr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:15:06 +0000
Received: by mail-oo1-xc62.google.com with SMTP id 006d021491bc7-6de2f213b7aso640666eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626102; x=1795230902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQ1xxDHv5qhDKLMrjvd/peKgYhy+qeIMx2uBdiELiF8=;
        b=g++q6sojhuxbGIWiQjHQpld1Q7h20LOSn5T7ZMJ5nH8y1K0PTWtxVojn9XmHuxoJzM
         OwAYucJjR04Z9xwckOk/cTSKY8JWowq8BPS3wnwoEvfzdZ/cqRSg4LEnGp9fzAc4hm3D
         9Q21vD8Pjwr9VmUbBOfctdK7Y7jeGP4FJ/LU0KICzynGV/2BcD5amMnl9UZoEt6OaOTU
         2sPh1XAZYf3EKyK3eR/GeGSSxumjAy4OZ+ZElHYo1bmMDjGsgNmFD5BXIHSwK+qA7ZZz
         kvio8gJ7aR3yuBTeyfn/sQfWVoFZQqBNl1BgjYk09NvpFGvPIHn6M9Ws4Ki3Gg3GOQu6
         xyNw==
X-Forwarded-Encrypted: i=1; AL+hErFy+bDLTHFmGKCBqp56xGxQPhIVrRODCZRARnzGP+w3C41ICLNnoUiVza2XTEEmihXmacbFv9+kn72Ujro+nkXZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+y2mvKnWuVQPvV0Mebh1+kTvw7+cYand93pKXUoUkIsPYBlk+O
	8hivmIP4BFUnmG5e/hJblsrO55N34nFFzUW6rn3L4MFbAVEWOcmN8CnW2ReAVq4+IDGdB1Ai3au
	t6IAuszzdfRWdM2nMqpOOUIQ5G892ndHVXpZWFfPXx0+bNeXIbpbvAAf4Avi+1kVsqdHIL/KoP0
	0gbAxbGEwstRibTWnZRedEcUP7OBIJGu4aVq4Smtf1pdLDqTXfwN2irJxEn5ZIyh9UVKMQrrYNk
	ThWGjvFOcGYGmFpEr5Hs/LRd+MGTjEqQ7s=
X-Gm-Gg: AYBFou0nyclqEwaeYS3K0ZHt6Sesh/juTzJ24XiQR32b+2qo+9h5jzySp5tSq7FPMbY
	7ENESEOlOZ9sW3BGQK5YwGitbDov0EjKI38i7Wuy5O0mGVmM2WrOBJ0Yk6pz7JC+hBlCVxbGMg6
	RqzyePZU0TEseisrOeP7bMX3Ssj7NfXeTurJ3gIVthRSFdrsiqrlQdLthF9j2DDwO7lhJfchG/U
	6eGf5ObRKsNtlwbIRcLVCSIhtVMetqAAEjs88SLAsII4ejv/cGiJK9s20swEJ7xHFWptV0L7nMO
	Tpm3TBydtl+M4x8IgRiqzPrUWq4gNkUFqQjfbMRv6y2EvFMSqQEuLLq8B7/zYXzaJ34VjwcXy3V
	cxukPVnUaV1zZTgTmlTXr0MMDnYVA+evmTIVeh0uZHaL0poI8N0ycs22M6b8mLycurpZAMp1dPc
	lI1rYO287R+Bm/lgAQxZZqGcXOiFMOzR1ZphgGabNtFUU=
X-Received: by 2002:a05:6820:a506:10b0:716:d5d7:6104 with SMTP id 006d021491bc7-71ab4f8ffbemr1902235eaf.15.1794626102070;
        Fri, 13 Nov 2026 19:15:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-71ab4228460sm117079eaf.33.2026.11.13.19.15.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:15:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so537860585a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626100; x=1795230900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQ1xxDHv5qhDKLMrjvd/peKgYhy+qeIMx2uBdiELiF8=;
        b=CyGKAHcYHqH58E+snzq8EAQsLVyv3Oh6QU+3vStyS9xBvtXho6lGqcfD8fu344gI3/
         XV73SmheTRvqQ3rkoV3F4KulbGvO0JmmHqjDG+PefvMslU5EleCcnlHjJa1ADa0n7JHk
         CRFImSQO+lrtuEqR83ruGIxO7qa8oy9yZjvdU=
X-Forwarded-Encrypted: i=1; AL+hErFyzAmaZQIQ4G7frIRU6RIM/nDMBYXW2SJdERmJpPbnnJfeMUwtVNhhnZSF2DWpePerXG0zR8inmEM9xJHiPPJL@lists.infradead.org
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr772454685a.17.1794626100300;
        Fri, 13 Nov 2026 19:15:00 -0800 (PST)
X-Received: by 2002:a05:620a:394b:b0:943:f31a:c0a8 with SMTP id af79cd13be357-9494bb76dc9mr772452485a.17.1794626099956;
        Fri, 13 Nov 2026 19:14:59 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949689e4e9bsm13970985a.17.2026.11.13.19.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:59 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] firmware: raspberrypi: Document memory barriers in property list path
Date: Fri, 13 Nov 2026 19:14:57 -0800
Message-ID: <20261114031457.871211-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_191504_118235_82D9E898 
X-CRM114-Status: UNSURE (   8.63  )
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

On Sat, 07 Nov 2026 19:21:35 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> Add comments explaining the wmb() before the firmware transaction and
> the rmb() before reading the response, as required by coding style.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

