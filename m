Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A74606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vAej6IFs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HMqHAJw0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zQWBm2KzcjyJTbZ4vsbbDLZy5idG2ggu74AoJJxfV0I=; b=vAej6IFsBAnhKW
	dITm/8OMTkfGAjc9JFrVgzKQRZERImv0ODYneGT014tR2/Di+3pCcfC+FXoXO1wm5Zh5NBMNKCTh/
	n+GX6qHV5+cknkNZEBNEKGO0AgTag42NodbbS9oAEyqCD4jEqAV/kWJm6S9uNJnkcWQsnnhXUBfAD
	14aYoFX8QpNALCJHVNfqnyYnAtcB36eJftp3DeiHLxpiEmfDl1KzxUcM9DL+j6VZfEYxi+OFVCT5u
	mQPVyJaZI3Mhsn9hGvJL2zuXe0oiS1UeAddn7Uy4uQVMPVIL4BUdc3/UqA5GkxDhXHsRoJiOHqi0W
	xBUh2RuEFnNkrIivw45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOW-00000000nZI-47lx;
	Mon, 09 Nov 2026 13:26:44 +0000
Received: from mail-pi2-x0a.google.com ([2607:f8b0:4864:3a::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOS-00000000nXs-1pYt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:26:41 +0000
Received: by mail-pi2-x0a.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso262847a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230799; x=1794835599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQWBm2KzcjyJTbZ4vsbbDLZy5idG2ggu74AoJJxfV0I=;
        b=HMqHAJw0BggjVbWfk8HJmHPm97h8EnUqfh1x49OOE/wh56LVSsETp5D8/QQSZR3DUd
         GeaBk64HIsWYxsda9HMOfqp4c+BA3CybNuboMjg0W5/uBAgq9J1raeohPFnZfKgkuCBn
         HmQS2RfKx3xugLkRg/l3OsyFVqSjdHiH5rNl5YrP92/H8Mw7BwwUssGbWRst4gkV0cHa
         z0DaKxauwgr3ZXIbcrlwxRARed9FDONgdtPcMQAQpFp2oySa3D8GsC+SEyKM0/nvHGAW
         WroVF0yqCd4o9r7BrRGgjea6BfrMSxUrBmJffZ44j+v0d4o776wcfQgUstw5WmOPNDUP
         OFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230799; x=1794835599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQWBm2KzcjyJTbZ4vsbbDLZy5idG2ggu74AoJJxfV0I=;
        b=t+nseveiVU5rg+KeqddptGOZTjli6b9vKgbaEE2HQBtwI0w/X50pdi196vBwrfknQE
         uvJZ3YsDfSlvsoCNLM7OuINO6z986YI31C+wh59WfSVfmZb09KJ5FwnqirpMYxTQB7zG
         rMJn2Y4hBOEb9ZY44W75YToZsnLFy5mRLtaZ7EG0TeW/QYhlUMdIEl01Ur/KhqyXlJg7
         VwXjhoxkKb0Gl4QQhGB60Lt3QqOQMGcKm7vNjVg6lQQKkGsdURhF+EkV491/3xJVyMtW
         oyHfdZG7UdyQ0CJpWmnHKFSL8apNQN5QCP0t7RU5rKwStqI+MadKpWb/TVzQdkLn1s4w
         x/vQ==
X-Forwarded-Encrypted: i=1; AL+hErH1wCiyTdaA0tUkk6pCddpyyo22l3pcu4rxnugJl7UOr2o2steLwdMUxxToIt3Q6FB8obeXRGaYJ5bsysGXqgw6@lists.infradead.org
X-Gm-Message-State: APuU4Z/LvLerBM3dYIvg8Oc481C0ReTcTX4j3yG4xix5u36ZhWYh9i0k
	9UmjLS9375TOIjEXhyZy3eGOYCJ4CLfzBr+pLMmkKADoAjICrL+6Iwiy
X-Gm-Gg: AYBFou0Xsc6jm584Cm4xVklFePZzKA734Z9xqvBXHRMu8QLNyGrFZ/nleKYFEJO3qJP
	OuSxPEzjyhy2HueVh5Uo3GxtHFUJWvMMh/S5BXiQ4yuqAOP9fWrAWSTka3R2n9RhsKoJDUjBF6M
	d/8iT66xkrU8ajtBg28Sw3JLuV/v51iJBLrofwGf1pfkqD/noVONYDCHeJDIGKTt1tJbegyrcvL
	B3mHDU8kVVJi39V7OSZ1tCIRg69cZZbwCgheF+/dDvXm6ojrPullOC+8FAJGc1xx27FtGBwC2ar
	sqjc/eDxsYIeXT3SRf7MbmmaH23u2uCPgbglWHprHwg/l4LCY5hBaNXShGDYFfUHqqe3CRAF30G
	rKf7gCi5uC496v26IPOZ/8rxrAKS3ECnjncNQjNcp/Z4iRk4U5w/CKQ5D+cpeZ3vUsSrusBznq+
	Q9wNw+rsIwd6RhOB3Yc3PlrNrd09lfi12tgfqjB3ACYGBLNV3wBZAasGg9u1Rfw+178lCYk8HFM
	cC0wuyN2C86R7iWw8fdRfLztugQlLGDu6iR446yuYA3l6VcdE578PUMOwd5DGi2lbCqyb4DsjPx
	xUUa3QUk2OiGaUnC79dxBAv8en4piYPX4jDk7vs5w+DW4sCsJoc51kXZ0Lt99Dj/1C06SMajzSZ
	8D+8GKglk
X-Received: by 2002:a05:6a21:488b:b0:3e0:eae8:7525 with SMTP id adf61e73a8af0-3eed3956cc4mr3311188637.64.1794230799422;
        Mon, 09 Nov 2026 05:26:39 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:39 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 1/6] fs/resctrl: Avoid division by zero in the MBA software controller
Date: Mon,  9 Nov 2026 21:26:16 +0800
Message-ID: <20261109132621.3862497-2-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052640_478278_378B1C0E 
X-CRM114-Status: GOOD (  14.69  )
X-Spam-Score: -1.9 (-)
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

The software controller estimates the bandwidth after the next step as
cur_bw * (control + min_bw) / control and raises the control while the
target stays above that estimate.

MPAM allows the control to reach zero: its bandwidth control is a
16-bit fraction, so 0% is valid, and its step is non-zero. The
estimate then divides by zero in the MBM overflow worker. On x86 the
minimum equals the step, so the control never leaves zero and the
division is not reached.

Take the step up without evaluating the estimate when the control is
zero. Check first that the target is above the measured bandwidth so a
zero target does not oscillate.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..dbc6770508e6 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -749,11 +749,15 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_l3_mon_domain *dom_m
 	 * on a system with 10% granularity steps, check whether moving to
 	 * 40% would go past the limit by multiplying current bandwidth by
 	 * "(30 + 10) / 30".
+	 *
+	 * A zero min_bw lets the control reach zero, where the ratio is
+	 * undefined. Take the step up without evaluating it.
 	 */
 	if (cur_msr_val > r_mba->membw.min_bw && user_bw < cur_bw) {
 		new_msr_val = cur_msr_val - r_mba->membw.bw_gran;
-	} else if (cur_msr_val < MAX_MBA_BW &&
-		   (user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) / cur_msr_val))) {
+	} else if (cur_msr_val < MAX_MBA_BW && user_bw > cur_bw &&
+		   (cur_msr_val == 0 ||
+		    user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) / cur_msr_val))) {
 		new_msr_val = cur_msr_val + r_mba->membw.bw_gran;
 	} else {
 		return;
-- 
2.43.0


