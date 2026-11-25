Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B8B606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fGw2yncN;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vo1pf2v6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kdXtsK5oiGz6RmA/ZpSIqAQiVji6Qb7T5uYbNNT0Kak=; b=fGw2yncNFFrPzrm92gZ3o7IdKx
	yNKMplZ4/khoeBhLhXQszG8naFWLF+Bki3+dte05gbzJmVPVgL8strQ+VoKI06JQN+AEbCOXNQ2vN
	6X2dn2vlFAL23hrstcRgf6uoI9h6GcbEkQg/xLCvT1228eJle+cNyb6INJxDWv/W5tgibmW0TAYPe
	Mu6WNAP0nPhhJ6HrFDg0M9dogzy2uxHOVZAmcd40Whx5eSdVhlpe6guSMPqdxdVNHYEBEJ/fVqi1L
	RD1JG2n1u4P2RG2sVMDzgjD4LHBH9YeFT/M8KOjZKCI06ll5d63rzId17dnTDPFAp+M1RC+D2xbBW
	8WMpt+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF2p-0000000ANFA-18fp;
	Wed, 25 Nov 2026 15:36:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF2k-0000000ANCo-1Aay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:36:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e3b22e971so3133495f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795620980; x=1796225780; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kdXtsK5oiGz6RmA/ZpSIqAQiVji6Qb7T5uYbNNT0Kak=;
        b=Vo1pf2v63UYEJZUiR+I+JGUaqrtpoitg067T4GY/eu1lJWLnAyck+Bcu4/eR85TCk6
         GkOl22KF30BrPjE5pxhFnz0Ry12/ecNN2awdTl8e7XiCEyWnCAuBpZ8G/KnwKWJgPh7p
         fecyEIOHtrBWsFPE1XsASXDPMPsSrvJwYmZ+Tel54fIjtxeZvy+MFTr9ql9prZ2nQ0hl
         68LbsFwJEDbkjdVUTVlk/+nrZvj2dhWV5WT+CCK6j0FqOoElD2yuC6J7v8l4Ls4NnaD2
         4bsA+LiPiqQj76cT3tar4AK/FDcY9zgPbwDNOVEpi6LdlTHTkH4jF3QrZkGWJUKDKlM3
         eBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620980; x=1796225780;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kdXtsK5oiGz6RmA/ZpSIqAQiVji6Qb7T5uYbNNT0Kak=;
        b=IgvHtrQDVZzISI/c3cAajBzPXdhtuHdG8YMZ0FVjPtIpaPn3PHDn4OAMi1Uyekt3gG
         BmybVl0BfwRNGVGnAXtCLuWM29FpqdTvAe2bJUa6y688LKQieqkuojHTRq+b2lwHnWfE
         lwzlzNAWfa1xDaQ0ZDS7WMw26FbVgPV47ROwohBE49YlLWx5FL1Shw4r4G3yjh8b1KpN
         fNpbd6YwTN8zndEuJZmizBYwz1WWCX+cMyjQViRExtN6uaN1ukAvtUA9Uya+6ElVYtvD
         6rqtlkzO0L1WtJT1wmKMeQHyrFdWwItEKqSf/LqDwHaIWESktTpPUnCNKOH42QfWskHj
         zM7w==
X-Gm-Message-State: APuU4Z/ZHbgpo4WKi/GKZCx6XOnIAAiIgzz9lHObtRjOqwyNHWaO2+qD
	tKS583hmjIWzG//MwPwt/iB8eBgB4k39gJz14G25WM6L4yWZ+SJ2B7WDp8lQx42xnBo=
X-Gm-Gg: AZFdTZdrUkSqOlAvwRn5WkICgLtrHEykfzeQdA4R2xyaiT1mxeMObJWYxlqu1W7lDAS
	ShZb6zFvoNKl7kBPUH1CGqdmSA2J/0QvtHaOZxauu8uHqKnV/qmZhBo9RRTzdu2OE84o3w1PWXW
	1nhrtAWcjf5TN5DALCwucRL3ubkg6UIxLaB0NMAg4RfO/FGR6Oz+xIffjUeCEBgnBonlQ9LiqpG
	18ZcPtZV7LWIphhR+t9vXF7QM/muWyfE8aj6jkht7nxMn5i1hMdA5RGVhmjeg7pYSPKGks9xFKH
	i84QnhRvM6/d6Yd3ldBsSmzsuSkjR91CUeHdP1ceL35Uex0MV9KECzT7qBj1Z0FX34UHBGQcNbQ
	K7RT0u8+MIsZ+v0+0dy4THXJy4SgzL9Bdhmh5AbCbqp5sqH6VpH9dX8iu/jzUtLazkvZCKxb/ib
	vhiGoLI+Vof1/SpVmEj653ZTSx10RUze0/4UZXsCIvPDVgonz3Xii1FYI4mMOZaYFvocdRh9Jvq
	GegStR899QIJ12cffRxqdpF+8KjmNqPDCQZeukCxXqV7npffhasRXHM0VgUD8VtVvbYvtw9jSt6
	9WnGBo3YThTBLURyp52v++Wvf0WJeya/7Kk6JKbF4zJBgWvYnGgV3g==
X-Received: by 2002:a5d:5849:0:b0:4a4:4229:c3a2 with SMTP id ffacd0b85a97d-4abaf7401bbmr39868108f8f.11.1795620980437;
        Wed, 25 Nov 2026 07:36:20 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b8e564e39asm5382635f8f.57.2026.11.25.07.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:36:20 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 25 Nov 2026 15:36:03 +0000
Subject: [PATCH] KVM: arm64: selftests: Pin vpmu_counter_access to one CPU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-james-kvm-pin-pmu-test-v1-1-c3ce989233fb@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGIAB2sC/yXMTQ6CMBBA4auQWTNJW1B+rmJcIIwykJamU4gJ4
 e4UXX6L93YQCkwCbbZDoI2FF5eg8wz6sXMfQh6SwShz19rccOosCc6bRc8OvV0xkkSsjCqaoqm
 VKktIsQ/05u9v/Hj+Letroj5eNziOExjFhCt6AAAA
X-Change-ID: 20261125-james-kvm-pin-pmu-test-720393980044
To: Leo Yan <leo.yan@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
 Colton Lewis <coltonlewis@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073624_163618_C59B19F4 
X-CRM114-Status: GOOD (  11.22  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The vpmu_counter_access test reads the maximum PMCR_EL0.N from one VM
and then creates new VMs for each number of counters up to that limit.
If the test migrates between CPU types the limit may not be valid for
the new VM which causes:

  ==== Test Assertion Failure ====
    arm64/vpmu_counter_access.c:483: !ret
    pid=9165 tid=9165 errno=22 - Invalid argument
  ...
    KVM_SET_DEVICE_ATTR failed, rc: -1 errno: 22 (Invalid argument)

For example on a Radxa Orion O6 with 20 counters on the big cores and 6
on the little cores, this happens on most runs.

Fix it by pinning the test to the CPU that it starts on before any VMs
are created.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Assisted by Claude Opus 5.5.
---
 tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 22223395969e..e7eac736260e 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -626,6 +626,9 @@ int main(void)
 {
 	u64 i, pmcr_n;
 
+	/* get_pmcr_n_limit() can be different across CPUs, so pin */
+	pin_self_to_any_cpu();
+
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
 	TEST_REQUIRE(kvm_supports_vgic_v3());
 	TEST_REQUIRE(kvm_supports_nr_counters_attr());

---
base-commit: 5715eba4f80a7655d85581c6c951b71d2abbd725
change-id: 20261125-james-kvm-pin-pmu-test-720393980044

Best regards,
--  
James Clark <james.clark@linaro.org>


