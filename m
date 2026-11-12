Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C806E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O2xOfXLF;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=m973B4rI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5yEBX8ZKycqZOP6+Y73EyUw52cEw6hCVyTtC7UHxHx4=; b=O2xOfXLFSrGOWOw/5Z30dOnxSE
	fWqk9ekouzSSlyDTBy6RPz2gG5ZBfFr4zZrfXjcGlSpuKhyyXgFlgmTWfTidEYELxUeVBaKDKmUH4
	bmIlcoyxXSkvFygQLPtQeGc0/1dgENZGH2TS6X0kKHwc0VLos8m3bLDctWZtY/WwZM7Ge4uYA9AOg
	pSwOIN3DOtD99szWrEfkR5NL4JN0j0bX6uTc5g+LZPd4A/Hl2j4jUl59lja86/gx/GilbtH11ig8K
	kRIF7KHjyakkg5v7g67Bxdl70Nu/OfTTGV+Bn0Drlq/mPbcg3CBKvNnw8JGgzrj/9j0SmlJmPAhqE
	C+Pa91EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYUJ-0000000AkEV-3uwU;
	Thu, 12 Nov 2026 17:21:28 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYUG-0000000AkDt-1qii
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=5yEBX8ZKycqZOP6+Y73EyUw52cEw6hCVyTtC7UHxHx4=; b=m973B4rIKJKWkH31TLIyylMdEG
	h2FYJt3osVqGgZAKePwq8VGo8dr0WXFB/Sjr2pO6T5V7CSOEP5HqzAhUBhCesVLoDRG81ldhZt4fx
	L+b7r7MxSoTKVKDZ6ZbywXqnHTb6qbWiCWtCWgPoebHp3eeoZmZILjqkk/ttpbfqpMdWGicVgKmC6
	Kg5Op+G+2qxHLHQjoTz7MnNLfUN2nM7cdc2M8gSW/VJIPIxqJixZ0daIuaec8h99Uj5mz0HZJal9b
	s2Je+/s4YfqiYcA4ht8yohRl9a8KzJuCR/Iw3bfWPx/Kj4pkkIP+NMPSfzIDwHLBsyMP4+PEtm031
	XXUPdQ5Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRYUA-00E84s-0a;
	Thu, 12 Nov 2026 17:21:18 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 12 Nov 2026 09:21:07 -0800
Subject: [PATCH] arm64: proton-pack: Don't query firmware for Spectre-v4 on
 SSBS CPUs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-arm64-spectre-v4-off-v1-1-f03c21744559@debian.org>
X-B4-Tracking: v=1; b=H4sIAIL19WoC/x3MTQqAIBBA4avErBtQk4yuEi0sx5pFP4wRgXT3p
 OW3eC9DImFK0FcZhG5OfOwFuq5gXv2+EHIoBqNMq7U26GVrLaaT5ksIb4tHjOiUi01wtlHdBCU
 9hSI//3YY3/cDw0OtA2YAAAA=
X-Change-ID: 20261112-arm64-spectre-v4-off-707f3d74308b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 atish.patra@linux.dev, thepacketgeek@gmail.com, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261; i=leitao@debian.org;
 h=from:subject:message-id; bh=LWkbKAGp3Y7xDCW1oETznHpRWADRbc7ruRh+moLNX7M=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq9fWLed+k3k0ibZR7//SagnIMHagA9+NN/gfB7
 7QsG7yM0N6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavX1iwAKCRA1o5Of/Hh3
 bUl3D/9s4UxixQz9H1237FraklLHh/z3vqlJrSBY/2LDDrBkVI3UJu9lMIQRl/+/1lZpj0/6Nq/
 aRYv6fgyL4/j44IJiNHyMQLADFuZBlS2oJOdHvODgSLJhfcuCxpQxovcfZWaa5iFmjeUdL6FBS7
 mwNDby/KY9vrPsvoN5oraVm1wC++s0rP74QdnDhWV5d9kJMMs4jBERlZ+ZUp7A1SR/+wzsRHOXB
 NpfhkeHSnGaedEpau4ntrMmI/rcaaUM8Dlh6kLIh2G9CIC705aUq9p6WiHL3OUM4HElr0L3UUKv
 3zHtzvn4+p544aVs76lkvbb/8tLWBtXeCck4o0fKwmR6TH1lYP38zEHfVjK+fqvPdN2e7z8BCcV
 Woc/SGT8REoodInHG8vSA4ZVeOpnU6Mbnksd2RmhwEWmvB1QT1/csNDsqfV0XLZQSji4xu0cwmB
 G1Oo1Ew80kEqAQGeysOyv8w972Z7DsHHQFDKfxfkaGmqI3ihpqiZARSLUnl9SMhYrN2emoqmE1T
 xWnxE/NfyRUJHPyixAOLe94XR0MLOhGjpkACaKQRAZWF1CuZz0pBwE/7IY0k58Ecy075lqC4rJO
 ru3QCj1umUHfl2kJPtHm7eNDgoFSbdgbuJZ1vqhunWT6j2U+MPx5NVKpUtx/JnEm5Nr0BSVSvqk
 zphorDxVfiFCXrQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_092124_562541_FAAD47A9 
X-CRM114-Status: GOOD (  11.58  )
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

On a CPU that implements SSBS, booting with mitigations=off or
ssbd=force-off makes spectre_v4_enable_hw_mitigation() set DSSBS and
PSTATE.SSBS and return SPECTRE_VULNERABLE. spectre_v4_enable_mitigation()
then treats the CPU like one without a hardware mitigation and queries
firmware for SMCCC_ARCH_WORKAROUND_2.

Firmware answers that query about its own mitigation. For a CPU with
SSBS it can report that none is needed, as
SMCCC_ARCH_WORKAROUND_RET_UNAFFECTED or SMCCC_RET_NOT_REQUIRED.
spectre_v4_get_cpu_fw_mitigation_state() turns both into
SPECTRE_UNAFFECTED, so spectre_v4_state keeps its initial
SPECTRE_UNAFFECTED value. The kernel logs "detected: Spectre-v4", then
reports "Not affected" in sysfs and PR_SPEC_NOT_AFFECTED from prctl(),
although every CPU runs with SSBS set. KVM follows spectre_v4_state and
tells guests that ARCH_WORKAROUND_2 is not required.

Before commit c28762070ca6 ("arm64: Rewrite Spectre-v4 mitigation code"),
a CPU with SSBS never queried firmware, and the same configuration
reported "Vulnerable", which seems the correct approach, given
mitigation=off ?! Same for prctl().

Only fall back to firmware on CPUs without SSBS. When
spectre_v4_enable_hw_mitigation() returns SPECTRE_VULNERABLE for a CPU
with SSBS, the mitigation was disabled on the command line, whatever
firmware says.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/proton-pack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 3bcf86154d95cd..80c5f6a198241c 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -638,7 +638,7 @@ void spectre_v4_enable_mitigation(const struct arm64_cpu_capabilities *__unused)
 	WARN_ON(preemptible());
 
 	state = spectre_v4_enable_hw_mitigation();
-	if (state == SPECTRE_VULNERABLE)
+	if (state == SPECTRE_VULNERABLE && !this_cpu_has_cap(ARM64_SSBS))
 		state = spectre_v4_enable_fw_mitigation();
 
 	update_mitigation_state(&spectre_v4_state, state);

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-arm64-spectre-v4-off-707f3d74308b

Best regards,
--  
Breno Leitao <leitao@debian.org>


