Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8159606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 02:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EdxRmBW5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHWyROK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RQQttVqr/R7iBy6MzhUoFsIhHj8TNdW/zBA3gjiLRU0=; b=EdxRmBW5mtOeQ0ZVpbAzMVACUf
	JXLQZcrvGFW7elwb20JtvG3HdN6cMSySrmQRNwpLS4CAl93WnmR8kOkzuRjglRoEBxBlNeOHWnF9c
	9pUo/sC6iK3cq57Kfx7GuxWBYQ6ajJiy9XQC6WqkGaKdZK80dQAEOjv1lEmmOTWUjdMzyvoe08CNb
	VBqveFptcIBPrpzszaIJTCV6Zn4slvldaT/lnwTkHHy32ZlPnXF/VERnf/MDyc5zCgmuI4B6sR1cw
	PMUlyQ85HfbaTEV3J4Ii7RB7VTHg7+2xYBs0q6CjRlIC+S9M9VfOjWjzJ6Y2HGHh2nDVk56Wg9C1k
	l1Paec2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgLp-00000005NAV-21S2;
	Tue, 24 Nov 2026 02:33:45 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgLj-00000005N9T-10Ka
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 02:33:44 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso1121144a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 18:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795487618; x=1796092418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQQttVqr/R7iBy6MzhUoFsIhHj8TNdW/zBA3gjiLRU0=;
        b=bHWyROK/G8l9pjj5Ynj46N4hW2aMyMSK9z8YdN0S82YPC/qK2ZTOqHkW6pXyuVRtrC
         nHFTKN3Ba7CAIIt+2v7MjXlRJxrofc6u1/Te8SjrVlCvngf3tYgpfmOzrLhOMnK1Uikn
         5+0YZk99f2Ui2goptk7Gix46tLbiv2H/7hEk3ntgLXLdZA/QvZnPL1DBp4NEa4qeBqVR
         v9nX9aWd4fBR96IjVnrzWC8W53ImyhDUCSzz9bLwiY/LQioL8liC5MBAhH9N/AVSl6xD
         znzFqvbo4no8Q0VTTdqLfj2PvS7crfNetRwofiUobDcjWjjIyojmeNIvqs5A0jeo1WeH
         jDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795487618; x=1796092418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQQttVqr/R7iBy6MzhUoFsIhHj8TNdW/zBA3gjiLRU0=;
        b=2ASnuaSVzLDOAcKLTW6+YQ26XMwp1sN0w1zmmK7w/onvR0+8r3VImwvImqymxbgPYI
         HNQklAG4QOa5gZrCzj7Ld3W8p6I/m7QAjv+SoFrvN+dw2GehcgYb/YMH5plrTzk5aWoo
         Cv78o69KpcF7E0E8EHvjmDENATfFZw8lgV2LJ9YTf3b+pSjmFnbGqysAtoWnctFhnbys
         dAtI5CVk9lRsPAKs07yCOeGtqK236tvO2B6XcVMsvO/mnoCE3cHkIBA3tK7AQk8IDsWX
         9vEuRAUC5tGyF+iEmshCLf64H2UdZXL4mGcDK4U5o/d5Up/1Vp3nrZJZgCkvUZOGYWRb
         dRBw==
X-Forwarded-Encrypted: i=1; AL+hErH/G1kyRxeeFAbmqI2dOTwBz3GqqY/jj4L8v5qP6zDW1WW35FOZwrN4jZWvymqo21hH6zcDpM+nuTg+k8NfQK4W@lists.infradead.org
X-Gm-Message-State: APuU4Z9Kj18F6+NzgTymbtzgU2msHRc8FOmiqSukbX049YIZN81lF6Ji
	+MJNO9fOW1O/ky61177dVPhZwed8geAYHtku2oJDSGnNWw4aBY/f3HiP
X-Gm-Gg: AZFdTZcqiiXCY9PKtYdBD2ABqubooQd5NbhgIdfdtFjXOmRgZ04NgDkppNvKltNUzp4
	hBxQyCXb+QGlxkUNm6Y+5rzt0l8DlBlSZ2sp+oNpQCfrT/lwKrGW2g837CF49yLV3+MTTBaD6Vn
	whyzT2oVEij1esoNdbi3oPntZp+U0wSHpM+qvF1ixMJ17vXZk1CZB5yv+arKCVw7aKuI+l0EGUl
	GpIwpp/NT+aSvAOi024JaZUZGe1LJB+cA3LPNijL891Q87hQ/bpvgmWxbFF+xKK+/ERJK9Rj2Vv
	803xQVSVOTh7PysSJFgbHBvPN5hQtBn29Be5X3SYlyuop+uEogkymMQZUPlU5Z5QVkbldbAV8OD
	ZqDMo7Ba4bQ+zHhlyn6EHAcja0GJiLAg+XUBfIz4CIJiaDfphaANAjcNyhfCIRT2jpS2QeArb7T
	29S6ZW+ZpInoQew4aFVVUKBd3qhOqH0ozjtCgMqI7/qpJZEElKd7x3xdpw9EMroj5Iu4kwkgmpJ
	GJc2lTkBFmriwmgTGAeMFLxKkoktqRSlzWLYoIV1FnNXb1QD6nXNdwS0WRT2aXRX9zGO7BvyOWB
	qYK3fQUscPOFCfo37vlnJH3uy7Y3ZIVkW2uZXwmqOSCoPZ91pIUx
X-Received: by 2002:a17:90b:1644:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b41c9a9cf7mr11736514a91.61.1795487617893;
        Mon, 23 Nov 2026 18:33:37 -0800 (PST)
Received: from fedora.lan ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde797af60dsm4709056a12.29.2026.11.23.18.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:33:37 -0800 (PST)
From: artem122novak@gmail.com
To: linux@armlinux.org.uk,
	florian.fainelli@broadcom.com
Cc: ray.jui@broadcom.com,
	scott.branden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] ARM: bcm2835: make RPCSEC_GSS_KRB5 modular
Date: Mon, 23 Nov 2026 20:33:35 -0600
Message-ID: <20261124023335.170889-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_183339_273236_3DDE7281 
X-CRM114-Status: UNSURE (   9.21  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Artem Novak <artem122novak@gmail.com>

Enable RPCSEC_GSS Kerberos authentication as a loadable module in
the BCM2835 defconfig.

This allows the SunRPC GSS authentication framework and Kerberos
5 support to be loaded when needed, rather than being built into
the kernel.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/configs/bcm2835_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index b469ecc36cf5..a8ae699e337b 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -187,3 +187,4 @@ CONFIG_STACK_TRACER=y
 CONFIG_SCHED_TRACER=y
 CONFIG_STRICT_DEVMEM=y
 CONFIG_TEST_KSTRTOX=y
+CONFIG_RPCSEC_GSS_KRB5=m
-- 
2.56.1


