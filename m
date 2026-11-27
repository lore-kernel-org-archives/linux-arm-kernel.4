Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132D4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qnPIaXVh;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TptThkPa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x2ph3tJO0wF67u279xWMKTDVsi25JZGANl4AM3ZKeTI=; b=qnPIaXVh0Us3Af
	dMjko5AI6fpfXTth2ayu+WKT6JAUpDu3z9gU/AGN17JjJ34wHnNBoIywuvlk2+9OavsMAI/TqSpur
	uU7ZIHNye7c/gBZOEL0txS2Ab01SwuCgIaq9U4PJeDg4wojfh3EQFweN+5o5CrwiEo4DTjoiReAAB
	FMZwelBTnsqejzxx+kKKLV+Kon5Rz+kqGoqlnhrWxaNIWiVy8gvJ99MT186zYkFimWT1vxMgtFqAK
	ADsJA9iAkzNuaoh00rY3kWr5K6Po6tySbfh4IGw3Li7jANV50s203si8qcTn+NtF78hWc861/v3Xr
	T005sk1rpPK4CwTWvo2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxv8-0000000GodJ-4BVS;
	Fri, 27 Nov 2026 15:31:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsY-0000000GmiA-18AJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:28:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83B9D1E4D;
	Fri, 27 Nov 2026 07:28:46 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 931F83F632;
	Fri, 27 Nov 2026 07:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793329; bh=eSKgfpq6erMkhPE8BARjc4AZ9OoO6f1AzBEKGIpJZBw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TptThkPa5bdTNpVZLD+TKE9VM5gPrnRS57lgKxBXKz34hvBYGDu+lL1cPuYjiBV7W
	 03zMnANTJUTuvhMstMRvk+TRH0euFL4gV8/DZvnHBwFyTEzz/tLs5WugyVrbh4ZpKu
	 jWLwmjOD0ZEXapgLW14T/OAORmwWwlnINp6NUOG8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:28:33 +0000
Subject: [PATCH RFC v2 3/6] Documentation/ctlv: introduce
 ctlv-attestation-firme family
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-firme_interface-v2-3-ab88b2d0b4e0@arm.com>
References: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
In-Reply-To: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Mark Brown <broonie@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4674; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=eSKgfpq6erMkhPE8BARjc4AZ9OoO6f1AzBEKGIpJZBw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaGncmU1WCQoOSsu79ygwoHEK70Kvtg7+xIBK
 t939vLQOu+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmhpwAKCRBt1cPRWsUx
 M9C2DACyERumOIWTl5y7byHWGEK9271zKshtGaenUWU01avZv1IUY+jw7uXLWjxTl/DCqnTlwLx
 PgwMQYa+7qzlfLxh31AyjyzQKbqiLgwA9ddvGOrcEciU/huYCYssiAbzGCVDY5+y5njoOhYx6Vv
 y9yqzadT+DnvVolMvtwJp4/ye4a5xU5kHGYqJjZz7YH99vWeNtQCkTio0ykl25flvFLVY1ANK27
 SoVd25QwkLzHJ9hoQDD/oHd3+rPrINPNJwgR0VArZGnPNx1wKeLNzatMiJplrMZImYhT+xdvqrN
 ztqGbwftYpaJm8UOGErrUqhoHQ8aJcZ70VKZlBhRZ1tTr++dog9f+M4mpJNeM1pEkfGsCnLcP8k
 IJAWEKUqi5nILh15NVi1IRU+WhDbZmuF5+VK1491O2GCWQlJWK2L/if5Dax/PN5EOVkxsOyStDU
 snd/9IEYQ+N1krxb5ic78n3+PMOQsY00IhW0f/R0VYmPGCCrI7fv2Tu8LQVf5/EYiBkqg=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072850_441315_6176D60A 
X-CRM114-Status: GOOD (  12.14  )
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

Introduce ctlv-attestation-firme family and auto-generated abi files
via make -C tools/ctlv regen.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 Documentation/ctlv/abi/ctlv-attestation-firme.yaml   | 19 +++++++++++++++++++
 Documentation/ctlv/abi/families.registry.yaml        |  1 +
 Documentation/ctlv/families.yaml                     |  1 +
 Documentation/ctlv/generated-files.yaml              | 11 +++++++++++
 Documentation/ctlv/specs/ctlv-attestation-firme.yaml | 20 ++++++++++++++++++++
 include/uapi/ctlv/ctlv_families_gen.h                |  1 +
 6 files changed, 53 insertions(+)

diff --git a/Documentation/ctlv/abi/ctlv-attestation-firme.yaml b/Documentation/ctlv/abi/ctlv-attestation-firme.yaml
new file mode 100644
index 0000000000000..68acbd17b9341
--- /dev/null
+++ b/Documentation/ctlv/abi/ctlv-attestation-firme.yaml
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+%YAML 1.2
+---
+# Checked-in ABI snapshot of the ctlv-attestation-firme family, from
+# Documentation/ctlv/specs/ctlv-attestation-firme.yaml, written by
+# "make -C tools/ctlv regen".
+#
+# Updating the file is how a UAPI change gets reviewed; an update that
+# removes or renumbers anything, narrows a bound, or makes a member required
+# is an ABI break, whatever the file says afterwards.
+family: {name: ctlv-attestation-firme, id: 6, inherits: ctlv-attestation}
+enums:
+  evidence-vendor-format: {platform-attestation-token: 1}
+records:
+  device-info:
+    id: 0x00010000
+    fields:
+      version: {number: 1, type: uint, max: s32-max}
+fills: {device-info: device-info}
diff --git a/Documentation/ctlv/abi/families.registry.yaml b/Documentation/ctlv/abi/families.registry.yaml
index 2146877a4f325..0784747a3ac87 100644
--- a/Documentation/ctlv/abi/families.registry.yaml
+++ b/Documentation/ctlv/abi/families.registry.yaml
@@ -10,3 +10,4 @@ families:
   - ctlv-test
   - ctlv-test-child
   - ctlv-attestation-sim
+  - ctlv-attestation-firme
diff --git a/Documentation/ctlv/families.yaml b/Documentation/ctlv/families.yaml
index 1fd60280cf037..49121305e3282 100644
--- a/Documentation/ctlv/families.yaml
+++ b/Documentation/ctlv/families.yaml
@@ -20,3 +20,4 @@ families:
   - ctlv-test
   - ctlv-test-child
   - ctlv-attestation-sim
+  - ctlv-attestation-firme
diff --git a/Documentation/ctlv/generated-files.yaml b/Documentation/ctlv/generated-files.yaml
index 2621d9fbb8327..b286e28c2b5b7 100644
--- a/Documentation/ctlv/generated-files.yaml
+++ b/Documentation/ctlv/generated-files.yaml
@@ -67,3 +67,14 @@ families:
         tools/testing/selftests/attestation/ctlv_attestation_sim_user_gen.h
       user-source: >-
         tools/testing/selftests/attestation/ctlv_attestation_sim_user_gen.c
+
+  - name: ctlv-attestation-firme
+    source: Documentation/ctlv/specs/ctlv-attestation-firme.yaml
+    outputs:
+      uapi-header: include/uapi/ctlv/ctlv_attestation_firme_gen.h
+      kernel-header: drivers/attestation/generated/ctlv_attestation_firme_gen.h
+      kernel-source: drivers/attestation/generated/ctlv_attestation_firme_gen.c
+      user-header: >-
+        tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.h
+      user-source: >-
+        tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.c
diff --git a/Documentation/ctlv/specs/ctlv-attestation-firme.yaml b/Documentation/ctlv/specs/ctlv-attestation-firme.yaml
new file mode 100644
index 0000000000000..fdc8022851a43
--- /dev/null
+++ b/Documentation/ctlv/specs/ctlv-attestation-firme.yaml
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+%YAML 1.2
+---
+#
+# The attestation device of FIRME for host: platform attestation token (PAT)
+#
+family: ctlv-attestation-firme
+inherits: ctlv-attestation
+
+enums:
+  # Fills ctlv-attestation's evidence-vendor-format.
+  evidence-vendor-format:
+    # platform attestation token.
+    - platform-attestation-token
+
+records:
+  # Fills ctlv-attestation's device-info.
+  device-info:
+    # FIRME attestation service version.
+    version: uint(..s32-max)
diff --git a/include/uapi/ctlv/ctlv_families_gen.h b/include/uapi/ctlv/ctlv_families_gen.h
index c90f98173c706..e4c0b06a6d7eb 100644
--- a/include/uapi/ctlv/ctlv_families_gen.h
+++ b/include/uapi/ctlv/ctlv_families_gen.h
@@ -17,6 +17,7 @@ enum _ctlv_family {
 	CTLV_FAMILY_TEST = 3,
 	CTLV_FAMILY_TEST_CHILD = 4,
 	CTLV_FAMILY_ATTESTATION_SIM = 5,
+	CTLV_FAMILY_ATTESTATION_FIRME = 6,
 };
 
 #endif /* _UAPI_CTLV_CTLV_FAMILIES_GEN_H */

-- 
2.43.0


