Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EB7606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QYGKj0bD;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IRzkBn1n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oQ7/76fO2leskAhxJa0tMmqKEgvrv4+HDmHvOOSZhVQ=; b=QYGKj0bD5iYkco
	GX5vWqIdJ5a2fb7eRRBnrHXXevPJUpoMkh3qe6qdMWXlziQ7m1Vc99SSsimR0+fah1EHAzddA7b1Q
	E93+QzAyf8aB46Nnwf1a/UYFDfHmkMllQiKogeNzPoxupfnjVlMVywz8TljAsb/R2ywAlluuAaWXa
	UlzaLJwnOatrkZAawtYZYu9Yuuib19v9jpjU8rmWNNwsJXwG0Ky/OZ5097Z+KmFGi3zqokNYtnqBG
	XH5/Ciwpm9mT5cinFxGaP8e5T1jJ9i9qaNJyRFUvsry6WTVmUrW8oQGPHlLon95iDUaLsRtOIn1Vg
	M5NHAbrm1ld5Ob2HqavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThT1-00000009FiX-1hrl;
	Wed, 18 Nov 2026 15:20:59 +0000
Received: from out-103.mta1.migadu.com ([95.215.58.103] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThSg-00000009FU0-0T2i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:20:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=47gIjtTcGEzXpA6nYjzGeB64WTHu7X3hRByD7TlCFJY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795015236; v=1; x=1795620036;
 b=IRzkBn1n4mpDu1Dua+yOMv7kmatnpDqqk6EkPdTCZvFhh0Dl1CIMOc/dOlxl/osIQYO5ZfEt
 VJqQ3HPaRBZuXktUrCgyIJjb0PNB4QuDkC2VjUCD31nRZkm31fVeSw1sw5IGOI/gLqd8YKGKMcD
 hD2yzfViYeXbzXZjq0ExEh7k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c3287a313e6c4790;
	Wed, 18 Nov 2026 15:20:26 +0000
X-Mizu-Trace-ID: c3287a313e6c4790
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/13] Documentation: KVM: arm64: Describe the ITS hardening
Date: Wed, 18 Nov 2026 15:19:04 +0000
Message-ID: <20261118151904.4099560-14-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118151904.4099560-1-fuad.tabba@linux.dev>
References: <20261118151904.4099560-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_072038_318433_6189E017 
X-CRM114-Status: GOOD (  13.88  )
X-Spam-Score: -2.8 (--)
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

Describe in pkvm.rst why the hypervisor emulates the host's ITS, and how
protected mode differs from non-protected mode as a result.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/arm/pkvm.rst | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index b75bb8ad6f26d..c1b1b8089ff72 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -89,6 +89,40 @@ DMA isolation using an IOMMU
 
 Status: **Unimplemented.**
 
+GICv3 ITS hardening
+-------------------
+
+Status: Host accesses to the ITS control registers are trapped and
+emulated by the hypervisor. The LPI configuration and pending tables
+remain under host control.
+
+The ITS reads and writes memory at addresses programmed by the host, so
+the hypervisor emulates the ITS control registers and command queue to
+ensure that the host cannot point the ITS command queue or tables at
+hypervisor or pVM memory. The hypervisor owns the command queue and
+the ITS tables for as long as the ITS can access them, and it owns each
+device's interrupt translation table from the device's first mapping
+onwards.
+
+This gives rise to some user-visible differences when compared to
+non-protected mode:
+
+* Protected mode requires the hypervisor to take control of every ITS
+  that the host uses. KVM does not initialise with more than 8 ITSes, and
+  if the takeover fails the host is not deprivileged and
+  ``KVM_CREATE_VM`` returns ``-ENODEV``.
+* An ITS command or register access that the hypervisor rejects is
+  delivered to the host as a data abort.
+* The number of device IDs used through each ITS since boot is limited
+  by the hypervisor, and MSI allocation fails with ``-ENOMEM`` beyond
+  that limit.
+* Interrupt translation tables are page-aligned and are not freed when
+  a device is removed, so each device ID used since boot holds at least
+  one page.
+* GICv4 is disabled. Direct injection of LPIs is not available to
+  non-protected guests, and restoring a guest migrated from a host with
+  ``GICD_TYPER2.nASSGIcap`` set fails with ``-EINVAL``.
+
 Proxying of Trustzone services
 ------------------------------
 
-- 
2.47.3


