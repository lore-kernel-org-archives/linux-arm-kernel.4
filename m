Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69E8606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mlfdteqx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WoA/C057
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CVT/Jsrak9CWWgyLzYEqWclX5ZEGQYp98hcXDikagKA=; b=MlfdteqxLGxeuj
	2AMiA3Vjasy02sgVFudSVJpDvLAwwMSlWp3zRBWUC9biOEO0LFzxjeYaRPOt/I1v0gksIT1EPUmRy
	SXrL0LNpPmYZwf/wB6XBsPS0M+J86mnj/FTT07a+bGVWfBR+ikK1ek37x0k0bhWT3Z54GFdQMteQ6
	Em5PwWRBeCn2wtno5StSarMqOeKLsicBjbhHXyYWbD307WChi82BsU4yx1Jwul2s+OjgyajYOQYjL
	FOS3s2VgkIEao3KWTLRenHBLfYVSzkmWtxcK6p/o/LRmzQNXoWM5I8csQUB4N+itwEW090Xe05o1H
	Tw7nDWC+RA3LDSVTvSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPIh-0000000DUui-110w;
	Fri, 06 Nov 2026 19:08:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPIe-0000000DUtM-1dTT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 19:08:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so8833815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 11:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793992110; x=1794596910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVT/Jsrak9CWWgyLzYEqWclX5ZEGQYp98hcXDikagKA=;
        b=WoA/C057eL0W6KBYrY2TaZerSzzdq3YXAZgT3C3CS3x0kk22xY7fCJ2wxDO/KmkLcq
         5+HEHN+qlLDbgATqCg3oVoGZPyDAPDrCioqMhX5yMCLOEmt/npsy+FM0bfy/FQifZIW+
         cw8LZsiKMnfZJyQhevnOCemO8HcuhRaOsYyjWhJ4bSwLzdCxCmPCMy+reVBb6tZJN+y/
         K6nl3T88szwaWEi1p+kVyR8J5rucKbiBNyQNxQX+aS0T0iAvj1hkQot/VDQqikrMftS4
         TX2uSnI9/PPs7ao6u/N1SsYsSltzw6tA5C2tTtYNtkUOxeIPLd0oXK1pXdH5vW5EuOFD
         B0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992110; x=1794596910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVT/Jsrak9CWWgyLzYEqWclX5ZEGQYp98hcXDikagKA=;
        b=fWOc/n3jGH+Qc9S3pjeqriO/58E9IxqmfnhmvlXkhrGdVLWagFJzXH5J4R/dfO/zbO
         HdgLsINyzFnEKTGwKGrLJezHunGYQ6Yn9abj72FQNq1S4QBDT/Q2lBZ0z9PaXo9+sFPT
         /fUd9aTNWaLWDE9ZvwJ+RHzW8z4kOQfvHmrEKDV16ziV0kLDvUizGfKuPw35xRkiIW3R
         Qx9+IBb+vvt6I3HznYEKL0Ijq5475DMTsjSHT2QEZ4kwAvDq47WmseP/fESbeBAx/jBa
         pJ2R3pdnao3UiiP6OuacmUUjsBoZkGiwA1R8M+kw7yDo6dbvKRikEN7tp7qhdVWZnIpC
         rR/g==
X-Gm-Message-State: APuU4Z9gZV8VoiGuBzQautMNC5WBhXLxur+GUZgYVgzAXNdO+lUkz1T3
	YHVxKrLZEAG0A+YhyvOPsFxmbeOYW+HJfvfKeb6jWSiG8b5/aTJi0aFu
X-Gm-Gg: AYBFou1uPfwRNBtPA8i6lQVXxeqqfEFURmnWPGAdiAlMKZ7+YlZLyMY7SPrL6mQruBM
	zStjbCDJlnFerAOJwOhmx5oUUqQPqAe7YIdbKS6dHU5xdmTN94r12m/UjQ45zLfGrmTlWs6V21e
	4Em0c6QO03bAq1RsVWi8ha2/Lmh4naxp06W9IcHFOE9YPBjhvUYwae5XoPjx6YwtOYd6gxP7ZM8
	1bCR9qk5y2UgHRjXn8ZhN7QzUOUyoWl5A+IMKt+5GI9hGnh30ZgYv0jlsN6WmlMJn6NsRw3d2Bu
	o+MA2N8rH/7auaD1nWV7EFkc3zFExgaeXuUKS/ow3vY+stNnEK03p2/iA6UPOIfn1kX7klhf010
	ElFHMDa7ndk4FJHJ7/RCAc7xfnSqtv3zqrQssYtG0301FvE594f7HRGoKkgFHa7eXRUYHbunTAt
	oE27lpizEY8k11tvGFgmw6Xm/iTwUpUAAmf5aBVZ77j9H8n34mRkw3dWebvUq0+hotIRmuVe/iN
	YKMsI9evbu5uVVDwmZFS/a7egp0HyPkaT+3K/h8ZJNLaNNFU1V/8VSM75fmkEnEnjz3lBTU78Hh
	UHLM9vR8XLlJ8l2ustyUkZs8oli2yW4AUOhav643ggX+RLti/hshVmVZ
X-Received: by 2002:a05:600c:1c1c:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4b6dfbac6eamr66452225e9.26.1793992110208;
        Fri, 06 Nov 2026 11:08:30 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb0b0c2sm456055e9.8.2026.11.06.11.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:08:29 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Fri,  6 Nov 2026 20:08:28 +0100
Message-Id: <20261106190828.3823287-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_110832_436136_24275FF4 
X-CRM114-Status: GOOD (  10.68  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Navid,

One more finding from testing on my H3600, more serious than the
others: with this series as posted, the board hangs hard as soon as
there is sustained WiFi traffic.

Setup: mt7915e built in, hostapd on the 5 GHz radio bridged with lan1,
a phone uploading to a host on lan1. The first bulk transfer stalls
after a few seconds and the system never comes back: no console, no
oops; only a reset recovers it. 3 boots out of 3, always within the
first transfer.

As far as I can tell from earlier work on this SoC, the cause is an
mt76 register read over PCIe that is outstanding while the PL310
performs a cache maintenance operation, which deadlocks the bus.
Serializing device reads against PL310 maintenance makes the same
test pass on 3 boots out of 3, and a 30 minute mixed WiFi/LAN/WAN
soak runs clean.

I'm preparing that as an RFC for linux-arm-kernel, since it affects
any PCIe device on this SoC, not only your driver. Did you run
sustained traffic over WiFi on your unit, and did you see anything
similar?

Agustin

