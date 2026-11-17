Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A62606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XKzKmF2q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c99HvclO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gwpUsyK05NpebcZHKBuJHcLynXCmkJRULUp5k1SU9r4=; b=XKzKmF2q1ln4SZG9ge47KNrphs
	xUAHpfvuZOxrfOJ16+Esm1rzHwpf4zdVVqTyczzyM3bDhcAz3+VKWUyahazlavSIxpuKOFfy1qf/e
	FJhkDIFNMsHN2745pv4RZJjj34UvNEB+jK8nBI5izkHJLmlmN2X7H7pJgC1GzzinVrB4HwnHWFE+j
	QMJ6tTpKPIf/DoFOcrLk0wNcdcfCLdOPk3gQj7rh+8eiUlUZ+4FRFX2N2RBwi5Aiui4wM5EJtuYnm
	mZAT/hYDp7CcnzCm6Q8VFBZim9CoZGhYPiw0bbluFYB0KofrFe47AvGwyLlVPrEMcR+RYFT1hr9lK
	/LIsmz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJoY-0000000632T-3n6I;
	Tue, 17 Nov 2026 14:05:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJoW-00000006311-2qRG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:05:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4937620f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924333; x=1795529133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwpUsyK05NpebcZHKBuJHcLynXCmkJRULUp5k1SU9r4=;
        b=c99HvclOfKR2vTDSnT7wQP+4B1PjhE4QVBoQRzvejmQhT2VtPVxF9tvEzLE3WKcHfs
         atK3/KzLUW5vFAtzW+rXW2voajO+w1VK/Fo8egYgYBTspODwG3xt9RdVvX601cn7jCT8
         KmZ1hchPqGnXtDlUzWS0gqYS7rjNmXuQPmIB/YWkcsx8/ueuwIPQM9xVPi0njSJAMLV9
         hTD/7zoR+oVadK9RBFPF78YCcAI+4UBhxahScit/94f5cJ7ClE9ken/ESP+HFE4p0mP6
         8Tqc/A9EVVZ1equWlKoPCaBx7xCc3lmI+E12TP83rWymKh0FfMFOKqhDGxHCd8QFupgv
         IA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924333; x=1795529133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwpUsyK05NpebcZHKBuJHcLynXCmkJRULUp5k1SU9r4=;
        b=GwxKsmPyPxMJtN1cIQvOFfcrKUtV+QyouwOTc3bZlXjziruTxXpxVAMXXeRj/y13eQ
         t2Y6xZdcDxe//QC711ueEUZOvLLw41UBBKE9f15TsxGkrj4PdJB4JHwAqPdxb//8mjet
         JIGJrQElp5QPHYh0feXuxz1JjfNyGJD+zXabYQUiOO25t17Gqeni1y5byYyiG8kq1TH/
         9srnw3ySE52DM8kEquG1gCY2XQbgq2jBateHvchTBrtDMORyGB2oEaWeF/PhrNAa7SpC
         HH2VTSxz8js8h0Z6HTPmMmazGbO3rc6Qn5Tpo2kRjreAmdJB5Exbvvh8R9s1he7aEmiG
         AuYQ==
X-Forwarded-Encrypted: i=1; AL+hErFhcH0BmnZBh+QDcdyF4iYa51LTNC4UcaPwLEdAyBXB0PZ9Qrf+IeVqcsOOApl6JNenwhVHFwOBTgpsR84W2Loe@lists.infradead.org
X-Gm-Message-State: APuU4Z+R/IxU43gdshnNG2ZpILO76S8aqB5+VMkZL3p6cNGVHGIw58SF
	VwoJ9qCQvy/L4gl4vT7YC3Z+ygSWz1PfRdQjZjma4Ps6/exJG8l7hu3H
X-Gm-Gg: AZFdTZdC1lwDgHziJ+Her7JeWZeDA+9XtnDA34H5phf5HX/vpBMfQBYUYkBvzLeiCok
	cLEvL/vKTvPXdMG2dBQA35DdBQWwcVP1dkQL5ugOVBMAC/y3NX0XfGXfP68B+inTdKVZbLsxVF3
	bRJMzAJDcNDpJjOtGknDKFdcpJ9hf8PSHJKXHcF2BWkxRV5+HMr3LGBncJZlB7MLaTDeF+poSPe
	fUVoD8x5Ro5Gh2DOv5igQYVfwgLkyExIXfT4NbZeMExweHwmQhtXWuTrX0aaI/SYj8G9qW7VokW
	oUUAQhfHtriUb94DVdx1UtmZrHCevB/1THNxihF4Hg9n5WUqy87rTWgeekfuFeFNsT97F9gBAhO
	HsNon4ekmJl40S6dRZIXv63Kj4blMFGUa1nIfiB+MpEU+fO225TrpzoJdTpt3R2Nvg7uVgHc4PL
	0tmYLWEFyr5bqsO9SOxlah2pUXNCmlZZ1Fkhul5f8xj332720Y867XBZGyI5SBANopL/MXL1kx3
	rflLeUAhEL9J0CJujhNpPayAhNvm/sIb9ttEUa4NLmsRi0Xmr7alasSCwiBSPmf3EaEAJ5Iec4R
	NpAMnT51JWJnbesf5KFQbDuhqHYODBNZaKCtyw==
X-Received: by 2002:a05:6000:2602:b0:48e:7476:9205 with SMTP id ffacd0b85a97d-49c71784d80mr30330262f8f.31.1794924333342;
        Tue, 17 Nov 2026 06:05:33 -0800 (PST)
Received: from fedora ([154.183.162.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm2623032f8f.8.2026.11.17.06.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:05:32 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	giorgitchankvetadze1997@gmail.com,
	amin.gattout@gmail.com,
	antoniu.miclaus@analog.com,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v4 0/3] iio: adc: at91_adc: fix trigger NULL deref and convert to devm_*
Date: Tue, 17 Nov 2026 16:05:07 +0200
Message-ID: <20261117140510.391907-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_060536_731867_14EB266E 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

This series fixes a NULL pointer dereference in at91_adc when external
triggers are absent from the Device Tree, and converts 
the driver to devm_* APIs.

The series is split
into three patches:
  1.NULL-pointer fix.
  2.introduce a local 'struct device *dev' and use sizeof(*st) in probe().
  3.removing manual cleanup and inlining trigger
     and buffer setup helpers into probe().

Changes in v4:
  - Split v3 into three patches (Joshua Crofts, Jonathan Cameron).
  - Patch 1:NULL check.
  - Patch 2: Separate the local 'dev' pointer introduction and sizeof(*st)
    change (Jonathan Cameron).
  - Patch 3:
    - Remove at91_adc_allocate_trigger() and at91_adc_buffer_init(),
      inline their logic in probe(), and avoid relying on idev->dev.parent
      (Jonathan Cameron).
    - Remove redundant dev_err() on trigger allocation -ENOMEM
      (Jonathan Cameron).
    - Use dev_err_probe() in at91_ts_register() and for
      devm_iio_device_register() failures in probe() (Jonathan Cameron).
    
Changes in v3:
  - Remove redundant dev_err() after devm_input_allocate_device()
    (Andy Shevchenko).
  - Introduce local 'struct device *dev = &pdev->dev' in probe()
    (Andy Shevchenko).
  - Declare the loop iterator inside the for-loop.

Changes in v2:
  - Replace the simple NULL check with a full devm_* conversion,
    as suggested by Jonathan Cameron.

Abdelnasser Hussein (3):
  iio: adc: at91_adc: fix NULL pointer dereference on trigger remove
  iio: adc: at91_adc: use local struct device pointer in probe
  iio: adc: at91_adc: convert to device-managed resources

 drivers/iio/adc/at91_adc.c | 229 ++++++++++---------------------------
 1 file changed, 62 insertions(+), 167 deletions(-)

-- 
2.56.0


