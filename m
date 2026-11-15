Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B727606A884
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SBDKmarO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjjYRbup
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OczTFag+4rrpYiC7SwR0JFMdaa1DWemeh7STu5Jts6Q=; b=SBDKmarOB8qA4NfmRC+QuCn1dF
	qZN7/rKj/EMD+xl5EixYtC2RwGOpJogfnUSWF8bGVdzw+9eVkOvGU2DUu4qxADuuVA875Fw1KLzng
	Gk7XWlaAuWu1oISua3eVHVkId56btUgmFzjeEZHLYXYN2lolfp5bM6Ab84v1nUnWoTpEGWGA5RroY
	p/sUihApjBaIgPV472DKt8mtwaw7fA5DOpOFNzOeNufZ+q3SHsGnp9f04x4ccQKtybnlElAj5GnIk
	3NMMBG2EHgoK39vlgXIaNgMDgpaEFQ4s3DNEQ0MtUDoC6sFpZbMc29sxTNkTIQQiUhQUdhwqD82Ru
	hPUs5jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP95-0000000GyY7-3ZPV;
	Sun, 15 Nov 2026 01:35:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSP92-0000000GyWu-2fOA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 01:35:02 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso13178565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 17:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794706500; x=1795311300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OczTFag+4rrpYiC7SwR0JFMdaa1DWemeh7STu5Jts6Q=;
        b=RjjYRbupDuucfMUWR6QFo20Gz09BJXyYfgIuMS9piRUMyFXM8mqNgbeL0QTv7lV1Ig
         IBdt3/qv8SWSdipI9z+4bXRSARfBtDmwPCopWsjMowc3IWlk2+3pgR/SJ2vJcGmnvFo/
         h8/XeWDig2xfZz3ze4JtfMHda8l2ZlgRvespU6OUh1GGSkcX8dG7Bv7cp6qgBh0Z+YRw
         00jUYSr3nOk6eYCIZdRxklF59M8ujdEAfU2bAjl70x34mLjZ84W7RrdJ5avrHBo1pFLq
         z622Jhly8LfY3TEsTO0Age0vLjwVzGBtTWrBkRx+TepuTsfhdtANKXDVsALNgBwzQNRU
         F5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794706500; x=1795311300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OczTFag+4rrpYiC7SwR0JFMdaa1DWemeh7STu5Jts6Q=;
        b=pG3eLxBCENnH1zJqeKs7Jx2qvC4nheA6lLKGMKl1+SGpDkd3a1F+mVnhIgqESDyhnT
         cGoMHx0p2DEED+1+yq+ddoJh5Wbn+NXHfJeoNZcSsYDliiLi9qZN+OS2sLhFdAc9DW4Z
         2HcaYCvL0M9i8EXNorah9smm11z2TxUMQJ5p7e3ffHItgkywU0ry1/kff05TrshbA6i0
         2ndl5csENI4Nw/2zM/yMI3pbQ+ayO1P8d9tUgJ3VnNtr9ceccf00audeSge3y+BreXDF
         9wO+VkA4ZwL/aPnwQAdDzIdLvFARMHFS8MbZJ8QCMw2u9N1uILpfUXebPhtysiAO45HZ
         uueg==
X-Forwarded-Encrypted: i=1; AL+hErEk0pW7q6Bd9nBceS2RAWdTGDLck1xnWixJbMditeOLwvZst7QehhC/3ncxBuO/UoXMxYjPWnA71MoD60XSQVEt@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZSxbqLXDCIEY+nALjLmnytCqJrcjEGJuNKOdBHou59SLgePAn
	MYTQXipCgpnqgiTqel9oiB1AdEgTAhFnUwRgBfafA4PrP43vhlhEVsjK
X-Gm-Gg: AYBFou0N76TD1Z9iOOLVDo0z6UCtCoqeSZe9pS2ikTy456EPTXxj/c+EOHRAUtn5Kwk
	c/XIVGQnt8fde+k0qX4rOGIZjTzm3+xEVNqvt24KcvCt8Jgsn2FiY7ejDjGAodeJpZBvQfoAlwK
	UD3sJv+NvV+ufMxGZh1Yc4ypC7Jtaepl+HnY5k0/tq4Su42Lf6CUBdp4EtRS6sW27kRDbUMhRrJ
	maqFYewyf4PC0OllmvY6TKmiYY5SGVV8FU4ME3FdsirIAH1QcUOlXxAP69BKv7NklJEIehS8krR
	TwZrlu76w5/2N4VoNgbDiFMY+zOMUTWhHaoGWUdUfE/B+PlU0aX4YGFNPV3aet8nNGPUjkcJwmS
	OxQnhZFUiyafgbxspbDmcw5ZM/fdj+Mr0fmo0/JEs351ZBGo0KNZZfR0QHl1ET8Z5ES94BS0e8o
	rOP1o1Dqjxt6HNsN9YJ1ENJHOre1/Fgo+3WXP+cG44aEvEH8QNwhtjHBBdV4eAbYyPZtI9rJByf
	4GlUHZHB7maKc0yr29gbC5fkaRMCHOU7y/GUT+hH2rDLryXC0h4FOeCtFL+WGb9ulXYTDShB7u9
	zV0q2EeE8YD7Goq+icC9HxdrT25JAVctM30C0fX268XAiiTkNiXshZm11XpaFtyVUEZazlasgL5
	AVQmyO13YkcfgBG+BCfR/5kzhCfcn/+FKyIR7gl5odi617xGPhHL3vfMfsf9yD37RUqJy03oAbi
	hNRKU4cDJn0nse6BZokcvUpnqH2tQbZ1SAcXJwxi6gd1x5hk5VNWlkroj3L4Vrig==
X-Received: by 2002:a17:903:3c2e:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ee0dc05bc1mr66811655ad.42.1794706499678;
        Sat, 14 Nov 2026 17:34:59 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm23671935ad.22.2026.11.14.17.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:34:58 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>,
	apais@microsoft.com,
	rachelmenge@linux.microsoft.com,
	hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v3 0/4] tpm: Cache ACPI TPM2 start method and gate tpm_crb_ffa probe
Date: Sun, 15 Nov 2026 01:34:52 +0000
Message-ID: <20261115013456.212141-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_173500_735342_1557B394 
X-CRM114-Status: UNSURE (   9.85  )
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
absent or invalid) and logs it when a TPM2 ACPI table is present.
Patch 2 checks tpm2_acpi_start_method in tpm_crb_ffa_probe() and
returns -ENODEV unless ACPI advertises ACPI_TPM2_CRB_WITH_ARM_FFA,
skipping FF-A probing on non-FF-A platforms while keeping modular
tpm_crb/tpm_crb_ffa loading intact.
Patches 3 and 4 update tpm_tis and tpm_crb to use the cached
tpm2_acpi_start_method value directly.

Changes in v3:
- Log tpm2_acpi_start_method in tpm_init() after acpi_put_table() and
  use a single-line acpi_get_table() call with typeof(tbl->header)
  cast (Jarkko Sakkinen).
- Remove check_acpi_tpm2() in tpm_tis and open-code the check in
  tpm_tis_init(), dropping dev_err() and returning -ENODEV (Jarkko
  Sakkinen).
- Remove priv->sm and local sm in tpm_crb, use tpm2_acpi_start_method
  throughout, drop the probe dev_err() messages, and return -ENODEV
  (Jarkko Sakkinen).

Changes in v2:
- Expand into a 4-patch series caching tpm2_acpi_start_method in
  tpm_init() and converting tpm_crb_ffa, tpm_tis, and tpm_crb to use
  it (Jarkko Sakkinen).
- Move the tpm_crb_ffa start_method check from module_init into
  tpm_crb_ffa_probe() so tpm_crb.ko and tpm_crb_ffa.ko still load
  cleanly on non-FF-A systems when built as modules.

v2: https://lore.kernel.org/linux-integrity/20261114193434.117714-1-sidchintamaneni@gmail.com/
v1: https://lore.kernel.org/linux-integrity/20261112233807.70664-1-sidchintamaneni@gmail.com/

Jarkko Sakkinen (1):
  tpm: Cache TPM2 start method

Siddharth Chintamaneni (3):
  tpm: tpm_crb_ffa: Only probe when ACPI TPM2 uses FF-A
  tpm: tpm_tis: Use cached tpm2_acpi_start_method
  tpm: tpm_crb: Use cached tpm2_acpi_start_method

 drivers/char/tpm/tpm-interface.c | 21 ++++++++
 drivers/char/tpm/tpm.h           |  1 +
 drivers/char/tpm/tpm_crb.c       | 82 +++++++++++++++-----------------
 drivers/char/tpm/tpm_crb_ffa.c   |  5 ++
 drivers/char/tpm/tpm_tis.c       | 45 +++---------------
 5 files changed, 71 insertions(+), 83 deletions(-)


base-commit: 7e52fc165aa50e70e8df3c879d04fc0ff1673d4a
-- 
2.45.4


