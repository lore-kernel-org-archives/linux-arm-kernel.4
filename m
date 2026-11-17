Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088F1606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X+g/K/jT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QseE2ehn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Xy0bwPAQh4MzmhEIOBjLL3r2eYe5OVhwYCxTDlIeXOM=; b=X+g/K/jT59zWxmr9LOkLfr9Poj
	/ikGHc9Agrnvand5+JexiGTncqvcS8Y4U6LpqmTNw3qcKZC2/i7XS60NTsrUVxShtv/yuQ7Nn8pn5
	3dyfMYP6/u4aK/0Ry16N4rYDQDkEwXYYgtGT6LFr+6aivtJRWcH78Zi5qnWSqqvyuoWLJZ+jez2Y2
	mdEc3gfuIiHiXUE8SF08VxZwoxTBqn3OwgknNnzl13tYTzgKe5pdDj+pmOk86jIqWG1KnXLQidlq0
	v2y5LkW27W7hHD2KZyK6Zn+w1IKGOAP17h4oo8zgYSj/1dhynWLJsoRWroccXpcDsWVaY/wU5OIYd
	ZF1g/P7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDtp-00000004p06-25lz;
	Tue, 17 Nov 2026 07:46:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDtk-00000004oza-335x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:46:40 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so3626902a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794901595; x=1795506395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xy0bwPAQh4MzmhEIOBjLL3r2eYe5OVhwYCxTDlIeXOM=;
        b=QseE2ehn709TfHQnrHp8mzlKJQB7YXJcFwPNJaijHct+O5wPNiZ/P7MKLzAbtSIDmo
         U0KyVAhZ1h9tZqgLAPbnypeQSdEIOvibOT66x+j+jzvqdemzJcLjHwvglvytV+3390T2
         is+1VDQTxLq09ESgK6XP3IrB86CSvWHJ6aos2FtBeyIFISN7D0TrOLtzQHreinyvpREl
         bdojpFeQ9Y+wplf1UdW36JeEYh+N6w90btmi/IcAjIV0yzztU2AUHAgToNk0S3VU593i
         15R+gkT01aqOCnDbsqj6co85ZcNvsxvbDP95qoV1Mef8aaJ7YcDZjjGkiSZwFHBwm8y2
         QAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901595; x=1795506395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xy0bwPAQh4MzmhEIOBjLL3r2eYe5OVhwYCxTDlIeXOM=;
        b=y2YpRko6FmqQ310ZA+Mc6di7zcp0SUtddCdELsynZT+67EmGbzZAK0h+ZwgfiV8oCZ
         hBCpGt0sdEdfmHxJbyP0FHjv+/HFwaaTOMuAhoCXccab/0/LmLL0P2BOoXiWY1yFOG1R
         Rpk01IjBcvcTViFPC4JkANjPaOh7I8S5ca5qyTXVObibMA86Lp64s7pPhZVLZvmPQIta
         YCYPvIDbB5BW6s38yZDTPl06GSabt5WofnNWGkVuesP7S3BnHtTnb+BwoCZzcMqGgQwX
         KYVPkOyZP+ll/QvcB/rITczukPHdy4q928Rq4gkXdur93/gkcRBIWCOjuwG/ZaMpzTNI
         0vbg==
X-Forwarded-Encrypted: i=1; AL+hErE2CCPIFRmP3nqvMFRarkOomu3rtlX1LUnNw8Fh9235FHH4BSZUpvnQnMmuz+jMyYz+H5JkISMdjAi4Wlw8zyKA@lists.infradead.org
X-Gm-Message-State: APuU4Z+0IWbEQ76aUm7Hn0mh3BlmdqEB4TSidvzYudt50cymjVs9A8+o
	v7Tgvey8+6zRWHO9EtBn3JqHwXla/0E7z4OnxT/0f09iz5kmyfTe5VjF
X-Gm-Gg: AZFdTZehGxqXUOi/14IUSfKoCBnin/cHCgZL3OraPaYluilrV07OrdIFQLVVLg6sv0H
	IWTaR2qxml9mKNK8twK13zGCjUZVgAvmQjP32nJKuFvB43D3KdWTMnVXs2NW7Dqgz/D5ykVydPT
	0iIJCAAfEPIptorj600SD3ye/OUS5wZG3Hdd41O9BeUrTqw5UBfjzT2ndN6w1b80DPTd8UjlOPG
	NRKY7xifFz4f0J9N7y5QQQRNFA1aKVVlm6HV7og+Mn9lcPfcyUFcV49x4Y0bLDbMAt9LKSP95ww
	UENvRd59qUjm0vauq+SP6xahNlYRP7k37aDVqHJfsgMOKuM+rEDCK858BFcY5ldbkVEy/lTABho
	0N+djn1V5OJ1c25V+cxnv8E8cx129u9SiD/LgVaTpbi6hSxvNMzEhGyIUYMkVBtLShw2XfvGXu9
	/U2xC/am6HO0d55UwsiONFDnEMB9q9b2nBcZaroOAncR+cr0NJD2mWGow489UmoDKT2+4kMdzm9
	FNH/kmpBjn/Zf5AdIHXbsOwI5g2OmaLf3O6GSlDy8KzX6OVAeDSbY6aY+wTKDwkZu1XKARxvRNq
	NolKNOOXQNS2HWSNQSpZAeloJgSJpImvNlfyZxjnvymAGenG
X-Received: by 2002:a17:90b:4ccc:b0:3b0:97b8:d6b7 with SMTP id 98e67ed59e1d1-3b1b0cc971fmr10801676a91.42.1794901595465;
        Mon, 16 Nov 2026 23:46:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm2866940a91.0.2026.11.16.23.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:46:34 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 7C7384248A7D; Tue, 17 Nov 2026 14:46:31 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Lincoln Wallace <locnnil0@gmail.com>,
	Joe Perches <joe@perches.com>,
	Will Deacon <will@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] ARM: hibernate: Replace links with lore
Date: Tue, 17 Nov 2026 14:46:20 +0700
Message-ID: <20261117074620.30340-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859; i=bagasdotme@gmail.com; h=from:subject; bh=5xgCi9au3vDG6thHydoq+7gGalby1Y8MkyFeA9bAaKo=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDFl/WDO1A9u82BvYlos/mnRXybqkbPbyr8wvkjPmLtgXZ Bf6729dRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACaScJ/hn0Je4/Qw65vCcoUb dz/f/Xbvqqd2fjevKPo7Vtj4fLPJXcrwV2ZqfSGTc1aBzFvH7UHn4pLj/P6dycninXJPxkZtN0c hMwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_234638_320702_79725923 
X-CRM114-Status: GOOD (  12.15  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

lkml.org has been down for a while (web.archive.org link [1]); LF lists
archive link return 403 (web.archive.org link [2]); and patchwork link
requires sign-in (web.archive.org link [3)). Replace them with lore
links.

Link: https://web.archive.org/web/20260208121703/https://lkml.org/lkml/2010/6/18/4 [1]
Link: https://web.archive.org/web/20191117150008/https://lists.linux-foundation.org/pipermail/linux-pm/2010-June/027422.html [2]
Link: https://web.archive.org/web/20191117001352/https://patchwork.kernel.org/patch/96442/ [3]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
This is an alternative patch to Lincoln Wallace's removal one [1].

[1]: https://lore.kernel.org/lkml/20260718175114.1404471-1-locnnil0@gmail.com/

 arch/arm/kernel/hibernate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/hibernate.c b/arch/arm/kernel/hibernate.c
index 231a76af09a03f..88048ff36aa40a 100644
--- a/arch/arm/kernel/hibernate.c
+++ b/arch/arm/kernel/hibernate.c
@@ -7,9 +7,9 @@
  * Ubuntu project, hibernation support for mach-dove
  * Copyright (C) 2010 Nokia Corporation (Hiroshi Doyu)
  * Copyright (C) 2010 Texas Instruments, Inc. (Teerth Reddy et al.)
- *  https://lkml.org/lkml/2010/6/18/4
- *  https://lists.linux-foundation.org/pipermail/linux-pm/2010-June/027422.html
- *  https://patchwork.kernel.org/patch/96442/
+ *  https://lore.kernel.org/r/AANLkTimmvPMG0GFEXfgFlXgC7V4dIWmW8vEC5gegsKSE@mail.gmail.com/
+ *  https://lore.kernel.org/r/1277908081-17195-1-git-send-email-Hiroshi.DOYU@nokia.com/
+ *  https://lore.kernel.org/r/5A47E75E594F054BAF48C5E4FC4B92AB0322A8AACA@dbde02.ent.ti.com/
  *
  * Copyright (C) 2006 Rafael J. Wysocki <rjw@sisk.pl>
  */

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
An old man doll... just what I always wanted! - Clara


