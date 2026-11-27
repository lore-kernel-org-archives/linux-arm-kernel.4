Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16737606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oeRFE8MN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=neA65pEZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pzaufg475Pz57QmsAGv8bsWqQ/JTVhnbVONLRz926U8=; b=oeRFE8MNP5pwh5
	urqYop7od7lH+HrPmhrQVmT4RzZsvjeDt4bF0Y1yev7VrnD6hhNxLZQ1pdUJpRtN/kSzmBXvQGU/R
	3ARRNbUWXZXDQuJGG+KlqZFQ4WwfDI+BQMTf/a7bqCHuWN1VsIVbomTlYsEqKvjLPR3BFTsHYAB2q
	XJcigKA2Iq8admvQo82DZbGa0AbXgYsRhw54gK33zV/HlrJZWqFCl15j3mK5KwWrDFR/qrlJUFLNL
	ewuNvFAqqGTClSjXrjff8wnx5xIqKSOzR8OtkerVX5XR5BIj3YGrE7e7Q1sMgu+x1L9fcvVzxZHH6
	yQzTAggsFJqRHpLeMfqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxY-0000000Gq8b-3YUN;
	Fri, 27 Nov 2026 15:34:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxx6-0000000GpwV-0Uhe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:33:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74A281E5E;
	Fri, 27 Nov 2026 07:33:28 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 200513F632;
	Fri, 27 Nov 2026 07:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793611; bh=6IbfmMlcFJ0SexEz6nfHhm7Xm35bKzPkYbQ2hmLmI4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=neA65pEZy27k1Ot3bsHIGQbz1OnGJXkS6+Hl/omESdNhMD58if34LqKQ/CYSfAzjB
	 u/TamZoTGacrHrDNtDq9hDjWMYLq4eWC/2ky4VlXxputYAKgQ5j7yJJA1pNTeYl/jZ
	 kjpk6JrtZMMN7zNA17DENwajnjsCsmDO/K5x/VMQ=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:33:00 +0000
Subject: [PATCH RFC v3 5/8] Documentation/ctlv: introduce
 ctlv-attestation-cca-guest family
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm_cca_mr-v3-5-df3230afce8f@arm.com>
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
 Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4752; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=6IbfmMlcFJ0SexEz6nfHhm7Xm35bKzPkYbQ2hmLmI4U=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaK1XlWtJHGD9n/sRRxrxOOlhNWD2MGxeQuQm
 aaglJkIywmJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmitQAKCRBt1cPRWsUx
 Mxc3DADZ3ulTuRyXibZkkPKxNV4ALf3+ksFTkkq6txkulZC3oXW24lheszgnsp14WEcaAzkih1/
 hlSJ+tRcw5kmuKkBzYhSyc4yfGJeBSUlGKMIh5ba6pP+n0mT4pO4DGUShg7VrHlgVSePWEsDLVK
 U6VpmwoxLiruIFJCyzRYBglBy0Xm82gpcql5j/67jcY1YAcUamx8wkQqvRVBLLeo8oMDdt43Ku0
 35OLsIDDK/FzaAQMrvng9Gl8nAWT5DnLA7olUNPbw0K+xEiLLK5X0eEsoLEzSXygrmgBOTIfPP4
 FyDeI788xIyiX5kNpDaCnAoYMSTOVCZ2T0DgQpSSALSvnyMHqx7KdqsBVjVwdiIi4KHi4LhXLc+
 G3fADFeb5ggNvnKosibrKydGOw+coG2jOBKOA3vD6eBaWekxkjytlSWtV9s7oYDQKDwIn/rc6jD
 axP6mEWkB8LjAj5h0U5UPnudxFN3LczLJWaIiXXlkBkEmE1zeVf2oWxsBpQY2azZPcFsY=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073332_243469_77789E94 
X-CRM114-Status: GOOD (  12.25  )
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

Introduce ctlv-attestation-cca-guest family and auto-generated abi files
via make -C tools/ctlv regen

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../ctlv/abi/ctlv-attestation-cca-guest.yaml         | 19 +++++++++++++++++++
 Documentation/ctlv/abi/families.registry.yaml        |  1 +
 Documentation/ctlv/families.yaml                     |  1 +
 Documentation/ctlv/generated-files.yaml              | 11 +++++++++++
 .../ctlv/specs/ctlv-attestation-cca-guest.yaml       | 20 ++++++++++++++++++++
 include/uapi/ctlv/ctlv_families_gen.h                |  1 +
 6 files changed, 53 insertions(+)

diff --git a/Documentation/ctlv/abi/ctlv-attestation-cca-guest.yaml b/Documentation/ctlv/abi/ctlv-attestation-cca-guest.yaml
new file mode 100644
index 0000000000000..27b1977da13e8
--- /dev/null
+++ b/Documentation/ctlv/abi/ctlv-attestation-cca-guest.yaml
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+%YAML 1.2
+---
+# Checked-in ABI snapshot of the ctlv-attestation-cca-guest family, from
+# Documentation/ctlv/specs/ctlv-attestation-cca-guest.yaml, written by
+# "make -C tools/ctlv regen".
+#
+# Updating the file is how a UAPI change gets reviewed; an update that
+# removes or renumbers anything, narrows a bound, or makes a member required
+# is an ABI break, whatever the file says afterwards.
+family: {name: ctlv-attestation-cca-guest, id: 7, inherits: ctlv-attestation}
+enums:
+  evidence-vendor-format: {cca-attestation-token: 1}
+records:
+  device-info:
+    id: 0x00010000
+    fields:
+      version: {number: 1, type: uint, max: s32-max}
+fills: {device-info: device-info}
diff --git a/Documentation/ctlv/abi/families.registry.yaml b/Documentation/ctlv/abi/families.registry.yaml
index 0784747a3ac87..21c6c3f978fbe 100644
--- a/Documentation/ctlv/abi/families.registry.yaml
+++ b/Documentation/ctlv/abi/families.registry.yaml
@@ -11,3 +11,4 @@ families:
   - ctlv-test-child
   - ctlv-attestation-sim
   - ctlv-attestation-firme
+  - ctlv-attestation-cca-guest
diff --git a/Documentation/ctlv/families.yaml b/Documentation/ctlv/families.yaml
index 49121305e3282..810bc07b4e5b0 100644
--- a/Documentation/ctlv/families.yaml
+++ b/Documentation/ctlv/families.yaml
@@ -21,3 +21,4 @@ families:
   - ctlv-test-child
   - ctlv-attestation-sim
   - ctlv-attestation-firme
+  - ctlv-attestation-cca-guest
diff --git a/Documentation/ctlv/generated-files.yaml b/Documentation/ctlv/generated-files.yaml
index b286e28c2b5b7..d388ca3e4bdd6 100644
--- a/Documentation/ctlv/generated-files.yaml
+++ b/Documentation/ctlv/generated-files.yaml
@@ -78,3 +78,14 @@ families:
         tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.h
       user-source: >-
         tools/testing/selftests/attestation/ctlv_attestation_firme_user_gen.c
+
+  - name: ctlv-attestation-cca-guest
+    source: Documentation/ctlv/specs/ctlv-attestation-cca-guest.yaml
+    outputs:
+      uapi-header: include/uapi/ctlv/ctlv_attestation_cca_guest_gen.h
+      kernel-header: drivers/attestation/generated/ctlv_attestation_cca_guest_gen.h
+      kernel-source: drivers/attestation/generated/ctlv_attestation_cca_guest_gen.c
+      user-header: >-
+        tools/testing/selftests/attestation/ctlv_attestation_cca_guest_user_gen.h
+      user-source: >-
+        tools/testing/selftests/attestation/ctlv_attestation_cca_guest_user_gen.c
diff --git a/Documentation/ctlv/specs/ctlv-attestation-cca-guest.yaml b/Documentation/ctlv/specs/ctlv-attestation-cca-guest.yaml
new file mode 100644
index 0000000000000..66dee6be4bb03
--- /dev/null
+++ b/Documentation/ctlv/specs/ctlv-attestation-cca-guest.yaml
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+%YAML 1.2
+---
+#
+# The attestation device of cca for guest: CCA attestation token 
+#
+family: ctlv-attestation-cca-guest
+inherits: ctlv-attestation
+
+enums:
+  # Fills ctlv-attestation's evidence-vendor-format.
+  evidence-vendor-format:
+    # CCA attestation token.
+    - cca-attestation-token
+
+records:
+  # Fills ctlv-attestation's device-info.
+  device-info:
+    # RSI version.
+    version: uint(..s32-max)
diff --git a/include/uapi/ctlv/ctlv_families_gen.h b/include/uapi/ctlv/ctlv_families_gen.h
index e4c0b06a6d7eb..209fbc8d61f0b 100644
--- a/include/uapi/ctlv/ctlv_families_gen.h
+++ b/include/uapi/ctlv/ctlv_families_gen.h
@@ -18,6 +18,7 @@ enum _ctlv_family {
 	CTLV_FAMILY_TEST_CHILD = 4,
 	CTLV_FAMILY_ATTESTATION_SIM = 5,
 	CTLV_FAMILY_ATTESTATION_FIRME = 6,
+	CTLV_FAMILY_ATTESTATION_CCA_GUEST = 7,
 };
 
 #endif /* _UAPI_CTLV_CTLV_FAMILIES_GEN_H */

-- 
2.43.0


