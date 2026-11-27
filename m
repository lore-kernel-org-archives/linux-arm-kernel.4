Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4623D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QdJe69gE;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q6it4Quw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JSaUcdyokx0nCM0VaAYNMMQJYWPBcRALhJ5U21pZ3u0=; b=QdJe69gEBw+7Eh
	61Vb4w5/lI0/ukjQf9hB7SKqFjFs8QZ9NrgTB+Qo/m06QVOs6dzqyyxNodK7AFzB2ISraKZOsQjd6
	3maupKBJgHLAQMGURIKTEihTB9eV7O+X64iMim7loPlAclKmgxti2GWQJZGFNshdKbK8785Am1y0m
	eZrFG7vzTIN/CFufxg7rUxDdCaxl67ITCYLKaYNKX+0w0IQsdq9V/CkwlRQUMrhPC+9t9nN3l9j9i
	R18wSL0C6jXu9eFiBhx9lihfHkFShjvsmc+IQeOWpxooyzRkT43pKFwvfns1haeaE5zQnKZORUv8h
	6eH8SYkoxPN0oC/e+m1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxX-0000000Gq61-1HmC;
	Fri, 27 Nov 2026 15:33:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxwv-0000000Gpsl-2j00
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:33:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42C451DB5;
	Fri, 27 Nov 2026 07:33:18 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E2D33F632;
	Fri, 27 Nov 2026 07:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793600; bh=kHJr5BFqohQ9MXCMflKsAGajKF4U2rgV+vAl7QLaA70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q6it4Quw4kEB8SrkkO8an/Sj/JOcvxksxATyDh/C0LHA8I1TSuTaRqvdX5Xp+w7/Z
	 uLFhf4sDoL7E8+ldB3hUKvpcedlKScA3aTMOZS9JIr4BF5E1pNRm0CJvP7lys3d4ys
	 ZaPdYFNnzcpqGFKlzlhRgBcelTAdXGJCvK3GliY0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:32:57 +0000
Subject: [PATCH RFC v3 2/8] arm64: rsi: Add realm hash algorithm defines
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm_cca_mr-v3-2-df3230afce8f@arm.com>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
In-Reply-To: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
 Pawel Chmielewski <pawel.chmielewski@intel.com>, 
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=CGmL714oNZ1rMgI/iJoIOGjAn2yDceA+mDSJkihQBwQ=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaKzhe4TF3B38fEAkPTJno3T/SIWTv5WKBscT
 lzOwxxnQYyJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmiswAKCRBt1cPRWsUx
 MwJJDACOsFwbayMWSJgzlyEf2W9O+7bjaZlEllPAimcjaxZyHTxF7DV7hugrXr/Rvi4c+Hij1Wx
 cqJeqSqEM/9gA0OyGpBkGyzl9CQqnoAS4YZnVeK04yd1vgh6suu0gO2IHsWUoUEfETVXdpkSET9
 cVT77a7xa8FN5XGMfCoz20RVgFOuNFA+F050sy5VchsTGlTxvIJ8tdGqrpv99WRTnpDesUtCxme
 YMVEEnZD+o/NAqb52Rs+B3P2jqgcuhGZh0pi/FBmL3pK+8qGhcosATZGXiLenKspNgkQnUGQRwz
 rHVwTm/nDCAAvAfBL5/UDI+3AVgVYVw79iEl9XXYiMJ/Be8MrMIUI7Wy9Quea3SR/tvhHiVM2ob
 EEzeJDBYH0cz0oIXZtz3H9H7xZCp3B/5eMat4vzajbe3jNh+jxfS65I9W8AToJqgkDS8XX/PYBG
 yObqM+soye3VqoMAil/mgRuXG11s7q2S16hRphhkRuP5nSEq/8TJnVLQeyRwyLdk0IBhU=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073321_739398_8F3D84C2 
X-CRM114-Status: GOOD (  10.30  )
X-Spam-Score: -4.4 (----)
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

From: Sami Mujawar <sami.mujawar@arm.com>

Add macro definitions for the hash algorithm identifiers, as
specified in the Realm Management Monitor (RMM) specification.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
---
 include/linux/arm-smccc-rsi.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/arm-smccc-rsi.h b/include/linux/arm-smccc-rsi.h
index cca881ddfdbab..cf8e157269f3c 100644
--- a/include/linux/arm-smccc-rsi.h
+++ b/include/linux/arm-smccc-rsi.h
@@ -144,6 +144,14 @@ struct realm_config {
 
 #endif /* __ASSEMBLER__ */
 
+/*
+ * The RSI definition of the Hash Algorithm (as specified by the Secure
+ * Hash Standard) returned in the realm_config data structure.
+ */
+#define RSI_HASH_SHA_256	0
+#define RSI_HASH_SHA_512	1
+#define RSI_HASH_SHA_384	2
+
 /*
  * Read configuration for the current Realm.
  *

-- 
2.43.0


