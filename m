Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sMkQ264Y;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ocOaSzK+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ANfkCzqxV9oez3uXmoRvr8M+fH7rHon0FntvlHoB7hs=; b=sMkQ264YXrCB6FAXtsiFaFY+Jw
	9tS0P/Nu/YO2ZPfvjSFDJxwrYcZEe6knKN7tndlL/R/HYLwshuUNrgQrr/271+c6eSM0eN8BpUyJS
	s/7DauKvP7IHGmY+vRKDH+63bcLAmr3+N9hQEJNyrWw07xNYI46aVgkdu/njX2TmepYUTmkapLtaP
	r6iE2zgwo7TYddnkWUwpej6eL8/EYSMsSWtjmOQ8drz8PkZAC5G2OJJV1ulRWUxF2js5W8VOuDDdU
	AsFbMy9LXDIEUrSpCk7/UkreEdWpm1nJgHIntegDsRtdWjl5IT+AYb3Qgf6aOwHyVXT7AYzWVOhZR
	GqitwooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTnD-00000003Ws1-2B3S;
	Mon, 23 Nov 2026 13:09:12 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTnA-00000003WrA-1wj5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:09:10 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2f04561ee04so18853625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795439347; x=1796044147; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANfkCzqxV9oez3uXmoRvr8M+fH7rHon0FntvlHoB7hs=;
        b=ocOaSzK+FObdvBoV12ySQDrd7/7ND9j07D6fkn3F3S8fqEB/NPyLEJf00pNchoyygR
         HqDd8eKB1JbiZkR3Gdnjd5DT1+FAK7/vuhE6pk9R4+dqfU82dcbc5TUQL6tDYcv61guC
         +x2QvLCKQIx0x9QuEWUOy3/KJKbrvMVWSDhy5AnyYuuqZKd3umGX9hxAGEj4lptw4Olx
         zrJKi6cp/mZKT25L2mZRvOlQYNYHCjpc4W1VFDcBFFtAs9joX8LyhIBNfD0CHEmmHijC
         oUzTw7QFKCipTlU5PNY5n8Ht4g6eLa/FR4j4MOwi1+S/Qphy1hChdFhz9mmxWRFIQ12S
         Jqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439347; x=1796044147;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANfkCzqxV9oez3uXmoRvr8M+fH7rHon0FntvlHoB7hs=;
        b=jBYbOkCEwodOZBKi1gztB6TJmhFD/EZGoRt6TCSkMOkPnLTCMRc+RXOLAY2hKLh+ty
         8pewJkfk9SnA4IVg7Pe/9/izA5Svd+riZRMlccqt6HtilHTx9w843iDgzaAu2IEzbxDL
         W6X9I9xXmZ53ub6eq7u97hoZjgFFaqsBfNRV8PWFUvABSPzASJ9fbowEAFD05GACAD6E
         URJbUAHhEYmjOYFu8piJuxWFnyeyshppr+UFnBRswf8FOCqH+JGrpayyrCcP+DYoz/i6
         nFznoNqQAJTDtENpLZymZ0Oe/GHO7TfXZ8RqKwOaeH4aqkWNpaNnhBSOEWIT9iNZZdSS
         kUjQ==
X-Forwarded-Encrypted: i=1; AL+hErGQDtNXqJCMWkj8hKrDCFvr2JM9qnySKuZhHMGQWv1PxCxxpgOLqPgOmQTf3YOOUNWxwX+5syfBF6TYBMPzyHlr@lists.infradead.org
X-Gm-Message-State: APuU4Z/HlHBIaTkaHUJTLX1SC3vUAiQWshrFbdQDSy2U/mkLYnJpgIJJ
	XMRzfKjTSXAgbHvA8gaUfFpzUxtEedl6BFypsVnhGSqY+WHtWFfhLY5BkmNMGF1Agu/1TuDl8+D
	4iix/SFpDLeAUxSilBXHfg4jJGw==
X-Received: from plkh14.prod.google.com ([2002:a17:903:19ee:b0:2f0:31b2:9171])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce0d:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2f03f1537bamr103175945ad.21.1795439346390;
 Mon, 23 Nov 2026 05:09:06 -0800 (PST)
Date: Mon, 23 Nov 2026 13:08:59 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123130859.3487100-1-amitamishra@google.com>
Subject: [PATCH] iommu/arm-smmu-v3: Support IOPF for masters with multiple StreamIDs
From: Amita Mishra <amitamishra@google.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Mostafa Saleh <smostafa@google.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Amita Mishra <amitamishra@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_050908_533075_34BBBA22 
X-CRM114-Status: GOOD (  13.65  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently arm_smmu_enable_iopf() rejects stall-capable master devices
with more than one StreamID because arm_smmu_page_response() hardcodes
master->streams[0].id when issuing CMDQ_OP_RESUME instead of tracking
which stream originated the fault.

Save the faulting StreamID in fault_evt.fault.prm.private_data[0] in
arm_smmu_handle_event(), use it in arm_smmu_page_response() to target
CMDQ_OP_RESUME at the stalled stream, and drop the single-stream check
in arm_smmu_enable_iopf().

Signed-off-by: Amita Mishra <amitamishra@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 100b34f07032..53c396d3187a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -954,10 +954,11 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
-static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
+static void arm_smmu_page_response(struct device *dev, struct iopf_fault *evt,
 				   struct iommu_page_response *resp)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	u32 sid = evt->fault.prm.private_data[0];
 	u8 resume_resp;
 
 	if (WARN_ON(!master->stall_enabled))
@@ -977,8 +978,7 @@ static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused
 	}
 
 	arm_smmu_cmdq_issue_cmd(master->smmu,
-				arm_smmu_make_cmd_resume(master->streams[0].id,
-							 resp->grpid,
+				arm_smmu_make_cmd_resume(sid, resp->grpid,
 							 resume_resp));
 	/*
 	 * Don't send a SYNC, it doesn't do anything for RESUME or PRI_RESP.
@@ -2164,6 +2164,7 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu, u64 *evt,
 			.grpid = event->stag,
 			.perm = perm,
 			.addr = event->iova,
+			.private_data[0] = event->sid,
 		};
 
 		if (event->ssv) {
@@ -3313,10 +3314,6 @@ static int arm_smmu_enable_iopf(struct arm_smmu_master *master,
 	if (!master->stall_enabled)
 		return 0;
 
-	/* We're not keeping track of SIDs in fault events */
-	if (master->num_streams != 1)
-		return -EOPNOTSUPP;
-
 	if (master->iopf_refcount) {
 		master->iopf_refcount++;
 		master_domain->using_iopf = true;

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.750.gf70dc682cf-goog


