Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821DB606A885
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RpHI5028;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVLSUc8P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Qn36dnXShc4fUhcrYLZ1Zx2GoiXFD/fDCBgNyF4SH4c=; b=RpHI50280Dwh3sBkTJhUkQW7pU
	uVotDLQREJt/fzLITApZkBI1BJ65jHaCpE15B8oEMZrGIDXwu/ms0hBmm2X/kJhNeKydxoss4kSMr
	CLoHYnwts/6DG+vGAiJugJibiRQ2JXr78XiKqLw3lL8f9IlGbJDlSFYpr14WuB0NjrHyguxhhXScr
	Ep5VI8+MGKvwZhMfQE10rMaF+7lbWL3JjaKxu/VHIwEKkIMvPPGU1/4w9cDKhOtV5+SVm2716OQ4H
	v0ju18oI7o6i8tJZjSjBTqjh4kfk4s0MHgwxA7ndVtHsoY79/KRGn2hmFVQjXlmdSM4L1TU5C9rjy
	TlXKEyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWN-0000000GgTn-2unM;
	Sat, 14 Nov 2026 19:34:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJWK-0000000GgSf-2PTY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 19:34:42 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3323272a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 11:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684879; x=1795289679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qn36dnXShc4fUhcrYLZ1Zx2GoiXFD/fDCBgNyF4SH4c=;
        b=qVLSUc8PUQNW7MU0UZnIbQ35kwDwn3rHFuvuHaxESeeyO9GKncmAtfS6LfbyatR+u3
         RnOXeZMbmkqePPQLGdRJrXvGSueCha9SUrnnA7bZrTQUrESaWRy/djJ+xKXn4Nk2Wbg1
         tl9Mpa9e3x1MxIbzUs1KeKWhVmST0Qprn12CMWXfz9zEahPZsON++/ezFuOoQ4KWawhd
         OO/VznrKQ7Hsx0vBuBeqOGha1CiVbFyC5LcZZUSVwW0xXZKONsVd6WWNw0aJjLqimbYx
         tt+nWKG8wFZ6InKDJiIkxUZXFwkQVJ+t5JlpYqHgYaD795TQKfaBedr680TYf2hRZPj7
         azPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684879; x=1795289679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qn36dnXShc4fUhcrYLZ1Zx2GoiXFD/fDCBgNyF4SH4c=;
        b=uOHSSH4FnrsmwSt9OJErPQLEWvtfuUoOeKWfzCcYmjI3OKPndkaOGGmrZH3NUmcUWs
         r4+SU++Jg69c/0CDJzyIdSwTmKm8VSWyb1vxxKzpdTjxDRg/wu2amvUktEY0UEB3ShwH
         qQrBXXx4GHCIQ6nIAR/OQSf2ffubX+Vnh1J4JBkZWHVAj2fOrRQ75zSq0V0SVoa+Gs20
         2zaUvAHucBSm2vapBBOdRqxldhzc5IAqWJsIG79m3RZjtMHURgINtwIO5lPg4Kyd5/MU
         Tj50yeeO3+xnCDOYe1desoEs2UzOfLQYOsMs+zwn3MuipKsJhAMcIlm+KCR1nlwmudKO
         myXg==
X-Forwarded-Encrypted: i=1; AL+hErFuOa9IqxYF731UrqiyVvM0yPvr4fPp0y3HX9MPfhIe2cp/50P3P+VlmLh7x9OqONoP24c8v4VriP8mKM9ealXs@lists.infradead.org
X-Gm-Message-State: APuU4Z83sQ4PPrHkPLvbCCG8e5IY7rbHRYgRd6Rk+uvwDvAJei0NeNoE
	zVq/TSHE/Ax0CP9HuhQRiMP9FOVddKBHeCQB+iUPJtaiyjOHc5AN+Lel
X-Gm-Gg: AYBFou2M9I+rJJWY5KD4ANrfeNmp49WnFPSPdbae37jmTkrXTCj7Vz9/4ZcawzorfVK
	GZlcsvK8AQ/LBxkmYpwV+doRqzxSrnxd4RsEq6EGfKPSzTBhSM6Ln+Y7avGtN7Z/vXQzsceoFRj
	LQUFeF6vCVCR25V0K1yR6n3mi68PYXlQ4OyCLnICzDTH/xkMQr4EcgUxA8Tbl1O0NgICIfUmiZX
	zstcHk/fHLrM15i6iJX8mU3Zp3FPVb1lDIwEjUYmPh4oCitWFn5a6URN7fuX24lCBO7jYWVVCyU
	LGDMEj4HVYLKxvwP9cPyW/87h1hWjp9rFGO5VVEcZLG8UsIMtHMLNBOm6z4dnh4AMWjMrWKGzhn
	JGZsdfh3jhmLZbGPJRbCmFEEyFF68RUKgmF/hBJVD7wI96yjjLevLDE57uerA3b89vmHFPHODbS
	krKe4JxRfASAqZkPI9qeTXHKDkcA8rT+ANh+oEXWKr86X17vO6P59rzCoDwLPvXGwEFA6rKct7K
	rblGOf2aUOdEz2+5YrwrNFH7i/MTy3uOQp+PFgsJx2uQFLR7dvHlnm1atqvzni+dmdva3m5Z9m0
	vMDa5lNLptoscraait56JP3IHDM1wNm2SL6s4i1MCxKdCIMkkcVi5V3e8CxTdMcS08UXULZkiiH
	r00QXJqKh9NWmDJ3A0/n8IXppsIcZkr7IMvAU0f3hLTFrztL+GGIFoUO7yZad6yM7LdKrRdYPaM
	m0d/IQTd1b7xflhKtY4MS1L8i8oZCNnezXYzPMqAuUUye6Q5o0ubDfnqQconmUZA==
X-Received: by 2002:a17:90b:548e:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3b1b0b8c31emr6819520a91.24.1794684878851;
        Sat, 14 Nov 2026 11:34:38 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm5093969a91.1.2026.11.14.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:34:38 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v2 0/4] tpm: Cache ACPI TPM2 start method and gate tpm_crb_ffa probe
Date: Sat, 14 Nov 2026 19:34:30 +0000
Message-ID: <20261114193434.117714-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_113440_620138_B04FB745 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series caches the ACPI TPM2 start method in tpm_init() and uses
the cached tpm2_acpi_start_method value across tpm_crb_ffa, tpm_tis,
and tpm_crb.

Patch 1 caches the ACPI TPM2 start method once in tpm_init() into
tpm2_acpi_start_method (defaulting to ACPI_TPM2_NOT_ALLOWED when
absent or invalid).
Patch 2 checks tpm2_acpi_start_method in tpm_crb_ffa_probe() and
returns -ENODEV unless ACPI advertises ACPI_TPM2_CRB_WITH_ARM_FFA,
skipping FF-A probing on non-FF-A platforms while keeping modular
tpm_crb/tpm_crb_ffa loading intact.
Patches 3 and 4 update tpm_tis and tpm_crb to use the cached
tpm2_acpi_start_method value during probe.

Changes in v2:
- Expand into a 4-patch series caching tpm2_acpi_start_method in
  tpm_init() and converting tpm_crb_ffa, tpm_tis, and tpm_crb to use
  it (Jarkko Sakkinen).
- Move the tpm_crb_ffa start_method check from module_init into
  tpm_crb_ffa_probe() so tpm_crb.ko and tpm_crb_ffa.ko still load
  cleanly on non-FF-A systems when built as modules.

v1: https://lore.kernel.org/linux-integrity/20261112233807.70664-1-sidchintamaneni@gmail.com/

Jarkko Sakkinen (1):
  tpm: Cache TPM2 start method

Siddharth Chintamaneni (3):
  tpm: tpm_crb_ffa: Only probe when ACPI TPM2 uses FF-A
  tpm: tpm_tis: Use cached tpm2_acpi_start_method
  tpm: tpm_crb: Use cached tpm2_acpi_start_method

 drivers/char/tpm/tpm-interface.c | 21 +++++++++++++++++++++
 drivers/char/tpm/tpm.h           |  1 +
 drivers/char/tpm/tpm_crb.c       | 19 ++++++++++++-------
 drivers/char/tpm/tpm_crb_ffa.c   |  5 +++++
 drivers/char/tpm/tpm_tis.c       | 18 +++++++-----------
 5 files changed, 46 insertions(+), 18 deletions(-)


base-commit: 912c3bad2eb993eb3e83c2689cd4e17361ef087f
-- 
2.45.4


