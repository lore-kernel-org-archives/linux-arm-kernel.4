Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E5606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nl8b8iZF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xKYPFGlc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dfLpaiZKgialdhZmLohg/bMfGz6NinnnazUQ52qYpko=; b=nl8b8iZFi737TQDvr37nf4uUsH
	xGwZyLh6dOV7bPb7zetRBpuB0tnfpSEYeQ8WdyZaRs81ntaDILBHQ6EB70Uew9jROCarn1DOJJnJI
	ph5tnEuLpMEZP8UbDesV1gRgAnSQPNVJtGSoJgV+6lzkBYKZR5hpOxUAW5aPGJGrj2YB44SqNqn5D
	0jG6/tIzSOehvNVVzImtGM3mQCHdPZb/58uuKXhlgKGmdcCRx82n5y8PhkW60KIV3OowNMqM6Nmdj
	UHdnvoXKgsIRPyJ3c3+urBJxBbfRUDZuXxS8P7BblVGx0+2Xbuc5VVCWX3vraDyfqoixOykqhx0mh
	zgu61BsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUo71-0000000HVIE-0Unh;
	Sat, 21 Nov 2026 16:38:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUo6w-0000000HVG5-3QMX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 16:38:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1019164f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279124; x=1795883924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfLpaiZKgialdhZmLohg/bMfGz6NinnnazUQ52qYpko=;
        b=xKYPFGlcACg6algsdL+ZHD1h7/BProNxFru/mrA5+6Q0Ro9qJoXfWds/s5PzXViOsQ
         SIRykTkIckJRDuUWDlS//GcYRJQlS9NUfbKn3P7uHiG1lkZ75e0GQm4pTkfdLkKdgcDO
         UaEvgvDYc0lkHAQ3Xs2Stw6Gjju5HTPQQ5k7XDnwzOe7X8SjLA5MSOtgbN0UeNq3T2gl
         A61hAOO4ah3/8sCNeTwWx4UnwXScN6Qph8J05QW7uYQxfy9VeNe4SCvrvsCab7PNUesf
         7+I3m2RWpwpeVvtWO5NxltuWRHaavq3293eGjbU1YuUduqIDbOPbAHfbE8uv0t3PbYM/
         p+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279124; x=1795883924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfLpaiZKgialdhZmLohg/bMfGz6NinnnazUQ52qYpko=;
        b=UTlTXti82R1FqG16VnTzwHVFkZjNEk2QEuRaP+G+J2HJrumpcu1G2hGyNPQJOMqaNt
         PaMd6OKvBqa3ulTcjuNPbyie+ATbkzOrfSFz6K0QMIWnKHHrqa+XruGSjjATWFBk/K9C
         jbTxklccQtIndm2+Qkudgt1NppXo8IRXXcOt9DeRHFNkbm27AMnchJpZpSL/g/ZugCkN
         6o8x6hnxz/RWlxlMN0+Mux11cHlVgPsvJrF7hGg72UyoK5ldx4zZKfPGY0KvfL4g3OIb
         vEF5K/lBLX9Sm5/hVU+oaUnkK6iQVJl+KJSURkpzPTlnFW60v1eXSTBLAhzKEKthGxi0
         m7sA==
X-Forwarded-Encrypted: i=1; AL+hErEX+btNU0rVqbgpk/yK1jGU1s2EJ2zQtY7ka1zaMCtc+PXbMUncx6cZWBKK4C3OUWoSXt1q958PNrlHkS6XFYrC@lists.infradead.org
X-Gm-Message-State: APuU4Z/Iw62FKfGXDNVgWq+bTR+MktBgiunD61GGkethHTYfFAFedWJt
	kxVmlc3RrtB/fRItmnkaFrbOO/yeJJgO618N1qF4HSyQRBRldRsHF/3pI9IqM3q99BM=
X-Gm-Gg: AZFdTZf2FXLFliQnhPS36pU8f8I3fKGU9JKqHI9xytbU3CBntfkWMoX+3MeZq+Lm9Xl
	ZA1r6u+AqjpkkMDqO6s6jt2DJhCuMuKorofjTgtB49qqnrUG36QdBbxaeTmnGFiKWcQ1Ebcx+En
	VNkuA89o/1Hx5Vl5o8cjYE2EM3IFT/LZ0hhc1lQJENX1gBeMvyBja+Zf8u3uQCi6Av/ZhcRO/n/
	hR59lMDfujLNhchEs88I6EpRMFxThFK5YAcC9kXdO733nd683LPK3dwhGI/G+pTKq1Jnh40S7sd
	aF9QB3Pfz9RDX/oRvuDupsHrcS+9dBMLyK7ttsfW60r/fJA3zPDOfugj0bhp6eodvRKNjVL7v9A
	hIvc4RN5EWUDiw0wVL9mkSycnTMeK+Hbhop0RlTZ/cYo6MUgqNWKA4fEBCl6pj/GICoyOLOaOiS
	+k5T5MJGA4GAC9uWX0eDXQncCuKITiQc9ZYBtNw/OzFLx2MwCS0EPgCvZJEc6ky9cfood+iPxli
	efO0om0XiGkvcapkdNim0XwzVSg4fS/pL8LHpFimSpwnZh74+ZhBycKb93hS7131T0Y51b1FS12
	mswXtoVRHa0sUkbRhl9PbKTbJAgVqxPIG0u7keTz3XrfcE6rZN6fkR25UTwGevau/6pD2lKbcEf
	Kjy6wnvhngqmtSX2LW5nwfDk7QZVyKXnCwAM77aCOAgoLBRjY7LNxgQZ3c0jtxRmn3ZFar9vH6s
	QX4Vc0lJLMU2VxDN7WE2Ec7ImcJtIPOOnF
X-Received: by 2002:a05:6000:2c13:b0:491:fd47:5df3 with SMTP id ffacd0b85a97d-4abab02d216mr13249942f8f.7.1795279124204;
        Sat, 21 Nov 2026 08:38:44 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm12468455f8f.6.2026.11.21.08.38.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 08:38:43 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mm: Ignore PTE_AP2 in pte_same() for LPAE
Date: Sat, 21 Nov 2026 17:38:34 +0100
Message-Id: <20261121163834.15441-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_083846_899196_D4C55A5C 
X-CRM114-Status: GOOD (  15.21  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For valid ptes, cpu_v7_set_pte_ext() derives the hardware read-only bit
PTE_AP2 from L_PTE_DIRTY and L_PTE_RDONLY. pte_wrprotect() and
pte_mkclean() only change those software bits and leave PTE_AP2 as it
is. Starting from a dirty, writable pte, the software value therefore
has PTE_AP2 clear while the installed entry has it set.

KSM hits this since commit c33c794828f2 ("mm: ptep_get() conversion"),
which made write_protect_page() return the software value instead of
reading the installed entry back. replace_page() then finds the stored
entry different and gives up. After a failed zero-page merge, KSM can
fall back to a regular merge in the same pass, so zero-filled pages
end up as ordinary KSM pages instead of mapping the zero page.

Mask PTE_AP2 like PTE_EXT_NG for present ptes. L_PTE_DIRTY and
L_PTE_RDONLY are still compared, so changes to the dirty and
write-permission state remain visible.

Fixes: ded947798469 ("ARM: 8109/1: mm: Modify pte_write and pmd_write logic for LPAE")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested on v7.4-rc3, multi_v7_defconfig with ARM_LPAE and KSM, as a
32-bit guest in QEMU (TCG, cortex-a15) and under KVM on a Raspberry Pi
400 (Cortex-A72). 1024 zero-filled pages merged with use_zero_pages=1,
and test_unmerge_zero_pages from
tools/testing/selftests/mm/ksm_functional_tests:

                     ksm_zero_pages   test_unmerge_zero_pages
  v7.4-rc3                        0   fails
  with this patch              1024   passes

Unpatched v6.12 shows the same failure. If this is better handled in
KSM, reading the entry back after set_pte_at() in write_protect_page(),
as before c33c794828f2, also fixes it.

 arch/arm/include/asm/pgtable-3level.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 7b71a3d414b..4a187d7be1d 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -161,11 +161,15 @@ static inline pmd_t *pud_pgtable(pud_t pud)
  *
  * To correct this behaviour, we mask off PTE_EXT_NG for any pte that is
  * present before running the comparison.
+ *
+ * Likewise, cpu_v7_set_pte_ext() sets PTE_AP2 in a valid stored entry when
+ * the pte is clean or read-only. PTE_AP2 is derived from L_PTE_DIRTY and
+ * L_PTE_RDONLY, which are still compared, so mask it off as well.
  */
 #define __HAVE_ARCH_PTE_SAME
-#define pte_same(pte_a,pte_b)	((pte_present(pte_a) ? pte_val(pte_a) & ~PTE_EXT_NG	\
+#define pte_same(pte_a, pte_b)	((pte_present(pte_a) ? pte_val(pte_a) & ~(PTE_EXT_NG | PTE_AP2) \
 					: pte_val(pte_a))				\
-				== (pte_present(pte_b) ? pte_val(pte_b) & ~PTE_EXT_NG	\
+				== (pte_present(pte_b) ? pte_val(pte_b) & ~(PTE_EXT_NG | PTE_AP2) \
 					: pte_val(pte_b)))
 
 #define set_pte_ext(ptep,pte,ext) cpu_set_pte_ext(ptep,__pte(pte_val(pte)|(ext)))

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.39.5 (Apple Git-154)


