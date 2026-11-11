Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED6D606A884
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ulzIxWjN;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DB8Fnq5a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=33GnvVNS774ak2dciyIkniSnSscVQNqOqLxBH8INFWA=; b=ulzIxWjN4d153Ju51v5LuhJHz/
	DosqqgtmEiBxrm7sJqXc4NgfBReUdil5URsK3WoJyx5ZszJ66MZ6dFgS9/a2Y2cHDsAtBeoE8qaOk
	PSgmH73SZRGMiMS0uiPv5ND2q3VotsGxZPIgRgjnF0tvWud/KRGVV5xogNuEkfphGfTQZ4eosyvim
	/7H2EbZm/2IBABo8sqeBcX9WkwVDetLz+btBAlK9onAOEmyHm4mBGRNecdKUk6Qj+8z1FleTbWJOM
	09qt5hgA7Otp5Aa4vfVhQHM4LJURiZz/b1wE3hdcomlSTvhdwJrbupMQXqk/4/QCFjn997XvnCVpG
	UvJM4Sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQm-00000007E1y-29II;
	Wed, 11 Nov 2026 16:44:16 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQj-00000007Dzc-2FCF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:44:15 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6b582b355eeso3260186a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415450; x=1795020250; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=33GnvVNS774ak2dciyIkniSnSscVQNqOqLxBH8INFWA=;
        b=DB8Fnq5aTxuyzAlVJA1y1cl3iRpU1qvM8WBkKqRwUb9/26OofSXv9a0KsocUCOCD9E
         yH7ArgGyCd6mySi0S7QEdNCLDLwrn7u13RmPLWc/kWmppiBOj+qaOEpwzNjzkpOMMGvJ
         ilMRRWE1aenMn7rVsOaotQ5KKAac+zDPgNJUPVKUrB70uCQQnWzCeuek8hh3wvMZi69p
         +I0X0sex+mOLFNVljq1TH4E5JYhQLDWtwBoJ8JVrTlM3eSZeqaIv2YhThGpPYVR7DzCK
         db/wqI7IiE88gC7NOrDTO4PIJpaLb3QR+0PuDEchnssftHLDDtsS0DXU7MFzT7OsVDhF
         dSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415450; x=1795020250;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33GnvVNS774ak2dciyIkniSnSscVQNqOqLxBH8INFWA=;
        b=y2LscZ0NNzepFCj9j7iyzqvW4ZcisOU3uzq+BLOMyg3m7zETLClUFiwsxqmLLBQr/W
         Ovm3p+k4p2A6mtPqFOHErZ1ySfqOcLOuc7mAlmTrmXrF+/TQAz3GrCBuTpEfUHtxFl3T
         7Ju8/V84PFdnJ8RQU++rw5ytRwZucIa4ctKVmqtwH4kvk3cbZx4TxorrY+6EwWr8tYn7
         GPYY2kGfzMoS59hGmiCtu55Tiv+frlbZ/2JVp9Z8Ttqhs7W1SPxR3C/a9dcICVf7Mq6p
         8gKp55S7Vp8m14o0HYAPaSIdrnx7QBQ5GzXemVqG6B5MLXRQ/RvIQg61yYSoioVvgWgv
         agjw==
X-Gm-Message-State: APuU4Z9+AhmA+naQXS0x9cfpjVN0cvQpyyR8/5e6xiZDTwhXNAM6CW9b
	MBI/4CDrCjkZXIR05XqscSGFfPGSlaVK6cfsEDinA7TUmdewyBQoetOJdJo4nDzPHTRY1G1IOMx
	ZbBPmgVYGNI2pMlOb9/r1h9X0Vb8nUhLf1kJoZUNPXpQsFAM1Q3IsAR1lXGLc9iOS6d2vkhl1rr
	qcHBvwf9+jFtqX4or5RG7uIxh7wuFD/XEWpByK6bYT/DgR
X-Received: from edyu19.prod.google.com ([2002:a05:6402:7d3:b0:6b5:6704:1178])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:210d:b0:6b4:86e1:cc67
 with SMTP id 4fb4d7f45d1cf-6b77780f558mr2265842a12.27.1794415450064; Wed, 11
 Nov 2026 08:44:10 -0800 (PST)
Date: Wed, 11 Nov 2026 17:43:46 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=ardb@kernel.org;
 h=from:subject; bh=QBNhN0Zdfm2xqf1Y020036BvrcSqB4Acy4H1DPuTpLQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevLbKcLcqdbcxeYz48q2B+ySOt+8nmjSo/jmzV7Hv9kM
 jki3VLaUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbiIcvI0Km3MsTeK4L9j2QY
 b0pVSeTuDcI1AT8k78wqD+l56y6yiZFhwkuX9e/vrLdep1ctc/Z5ssnzGKM//kE1h5a/fRFQzLe VCwA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111164345.4059964-5-ardb+git@google.com>
Subject: [PATCH 0/3] riscv: Align section markers with other archs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_084413_579318_5D43E68D 
X-CRM114-Status: GOOD (  12.42  )
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Patch #3 of this series was sent out as part of a EFI series [0] that
implements generic support for carrying image info data inside the stub,
and after Sashiko found another related issue, I decided to break it out
into this series. IOW, patch #3 is a resend.

The point of these changes is to harmonize all architectures that
support EFI in terms of the section markers, so that generic zboot code
can refer to them without arch specific #ifdefs. Other generic tools
probably benefit from this too. 

If the maintainers are onboard with this, kindly put it on a stable
topic branch so I can refer to it from the EFI tree.

[0] https://lore.kernel.org/all/20261110121731.2728824-12-ardb+git@google.com/

Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org

Ard Biesheuvel (3):
  riscv: Use _stext not _text to denote the start of kernel code
  riscv: Make _text point to the start of the kernel image
  riscv: Rename __init_text_end to __inittext_end like other archs

 arch/riscv/include/asm/sections.h         | 2 +-
 arch/riscv/kernel/image-vars.h            | 2 +-
 arch/riscv/kernel/setup.c                 | 2 +-
 arch/riscv/kernel/vmlinux.lds.S           | 6 +++---
 drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.611.g1030f0b940-goog


