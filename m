Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C451C6082BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CxrRAvqT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PvDjU6Gm;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=miGUCVrv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wgtb9kfhJDQT6OIlDEFANW5PARd8orgbcoPjl6TcZEI=; b=CxrRAvqTHorzEy
	iWzvyhTZ6RhI9b4Mx/qWDajW7J9QyL819od8V0BTYjIFFH3AqZnlxYDRwD3gVxWoswWA+i5DVSEuP
	qJ5FwpmoTSthxqO5D59S7G8Ju/NZYfoaEqBu6kG6H4eXXb2aCirmzNiDV4CZ8RrStP1/mqMtei1J8
	uqIpFaIQxGLVDv+fHvZ70GXjhFHMGgxjE0JdhVp50b5l3//jCJWLBm0v1SjqIOcqdXLhX0V+skgfX
	JbHqxxH9AglgDw7UHOXsRT4f0bMMfWP/ZYWzum24yNMWF93El5+D3CeoUOBOoxIkoj5TT8vhBoAM8
	75RdAl3NNt4jmNorWd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3w-000000007Ct-1Tdj;
	Mon, 09 Nov 2026 08:49:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3q-00000000795-0ZNg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 08:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Wgtb9kfhJDQT6OIlDEFANW5PARd8orgbcoPjl6TcZEI=; b=PvDjU6Gm2+AW6Y+lKmyvokWUYF
	hRqXFG1dLOgFk7lrtFdII+s6u/S9V+iYVZK9uSYdwodV49qGODmnjfpSzC2mEmF29AOKDoPyzuUrU
	zVgftmGSckiSeRtFZ8j/0DRQ/hlKzwcqPlGh32ERF9x2Ryh9y/wON8UhFH/N8KgfWic8C0/SUFlDh
	yccW9lbW10dL0pOYUfn/Nlnd2m0nPLf1rmaoAYp0WAn4g/B18Ni2LL4iDQqDYekHPFUrvee9FAF0D
	Cmo9wFliVP2Bko48smjWtp7W2/zA2GGsSZL4bjf+Fg8J76gJdmWwfLpARPBHIk/PJF7TU8SUFHShl
	xPQHuuSw==;
Received: from out-160.mta0.migadu.com ([2001:41d0:1004:224b::a0] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3m-00000006TVU-3FDZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:49:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zy9OoZoEVLZKrHt/PA6PNvYObGqJuDPk1PHvlEStbBI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794214139; v=1; x=1794818939;
 b=miGUCVrvJufBAYD4nQ4Mr4V/oWr077wWuAHlTXnc+xnIGO36zplrKgeVOB80+uJccnfjscnf
 kroAvneRR9sldAQvsrB+asOl8eYrp5n6w359bAbYAS0aMujA6EzyeLX/0GqfMa2LKzNqTvo1yN2
 BwNzVMKoMlvzd0nB+/9zMVfk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d8a3008bccb79f4a;
	Mon, 09 Nov 2026 08:48:57 +0000
X-Mizu-Trace-ID: d8a3008bccb79f4a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/19] tools: arm-smccc: Add the pKVM memory sharing function IDs
Date: Mon,  9 Nov 2026 08:48:39 +0000
Message-ID: <20261109084854.840576-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_084903_010284_6EE7EDE7 
X-CRM114-Status: GOOD (  10.74  )
X-Spam-Score: -0.2 (/)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The tools copy of arm-smccc.h lacks the pKVM guest hypercalls that the
protected-VM selftests make.

The kernel's arm-smccc.h defines the vendor-hyp UID with UUID_INIT(),
which requires linux/uuid.h, and tools doesn't have one. So rather than
sync the whole header, copy the function numbers and IDs of HYP_MEMINFO,
MEM_SHARE and MEM_UNSHARE from include/linux/arm-smccc.h.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/include/linux/arm-smccc.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/include/linux/arm-smccc.h b/tools/include/linux/arm-smccc.h
index 63ce9bebccd32..8c8f4ad639018 100644
--- a/tools/include/linux/arm-smccc.h
+++ b/tools/include/linux/arm-smccc.h
@@ -111,6 +111,10 @@
 /* KVM "vendor specific" services */
 #define ARM_SMCCC_KVM_FUNC_FEATURES		0
 #define ARM_SMCCC_KVM_FUNC_PTP			1
+/* Start of pKVM hypercall range */
+#define ARM_SMCCC_KVM_FUNC_HYP_MEMINFO		2
+#define ARM_SMCCC_KVM_FUNC_MEM_SHARE		3
+#define ARM_SMCCC_KVM_FUNC_MEM_UNSHARE		4
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -133,6 +137,24 @@
 			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
 			   ARM_SMCCC_KVM_FUNC_PTP)
 
+#define ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_HYP_MEMINFO)
+
+#define ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_MEM_SHARE)
+
+#define ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_MEM_UNSHARE)
+
 /* ptp_kvm counter type ID */
 #define KVM_PTP_VIRT_COUNTER			0
 #define KVM_PTP_PHYS_COUNTER			1
-- 
2.47.3


