Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C51606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jtmOv66u;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tf26TdJo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rW7wY2dSAmljd85v6jjosIWS8OLneAfUfN99gDJ44Us=; b=jtmOv66uL6OTf7wH7wJujQN+I8
	ftkt+qDZjiU8rfFLdX3ELi2QgNRaVNlgCdx5sJof1IrkrXYpEECV8fQ8nVZ3CY5our3KJH0+pzWNo
	qGxKbhMzfJd5RF25vlDRI4U2I94DnqZAepSMGPhTCRyQd5w+3efZjGDZ23tOP6br/olKXusbRn7Lw
	EfrAumXaMHHxXRG76ZF6Wxn8kRYLFiwVtu4a+WLLiGMDz1Y+imYLhXY6a/VXoDchNLvt/G4FVR98D
	LriTf/Exaf7tZFWxFSk7gsf0CRn0v6q0NP7PnBI3ZIEjqZwQHDxa0Crn5owXRUVFfjV4DEXiULmUZ
	HSZvFOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnXM-00000004KZS-1ipS;
	Tue, 10 Nov 2026 15:13:28 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnXK-00000004KYv-0Rwr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:13:27 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3678f64d078so2625583eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323605; x=1794928405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW7wY2dSAmljd85v6jjosIWS8OLneAfUfN99gDJ44Us=;
        b=tf26TdJoY8JD8hTu7KtN7yAerHs5xaN5BsvALjoLvqWa6CxugVTANCcNKg3uRXekXc
         chVEnKjluUGymTcUV5olF9/iAOOeWA8INW9Ejqem6oU40qCgwp7Acku5PTW5ZHgvF3z+
         jPL6gxE0OcwEhxfq3NE5fzoJqa29GIufyflS+fmKL4+slCOsnaUHNFHmOyfoWcOxAILB
         KPO2+C0nX30oWNcqKw95jET/EXYYb1HgFfqAysnIXqJQaSdRgS2vptuDlo8Q/yBKiJTr
         99SXPaF+XtfQaz4mcgR8twZPaE0sHX28wNtmRbEIoUdGYH7m2b1SNz39mL5GH4AxBaog
         xVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323605; x=1794928405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW7wY2dSAmljd85v6jjosIWS8OLneAfUfN99gDJ44Us=;
        b=x5u3SwTn1M/gcG7OpUKS5hzxD/ukAutrmO9S/R4CTX2QDRSU2I45TwJ1xMN4J979zA
         ILdrKUOeb63mfSaoTTQMqFxkTIh8kn6ToVTvNzl4y921+5a7NDAuLbO1P1W8SrUnZAXg
         EmMCnkP0GEwvptHTzQkm2zTagSKKw1kgvSkMQGxdyxSDfzdacXMqz0BBPXjNjBxpwY8m
         ah8EyeU5IErXLR1HeoEa8nvkMqxXz+K7U1e5D6uJQibS1TVCIYIhGn3sczdTEsY91wPK
         JS5UHs3GqCMH/u0qJWq0/zLHB3Ua6Jy0ukIh+doDbtvCmceP82j8DilzS6I10+y67wv6
         p/aA==
X-Forwarded-Encrypted: i=1; AL+hErGrkszkNyQiEmZjU3kpIHB1rxd+VlzWpuQCgcq1fsfbw2RpCbOq3gB3cXtGJRlpEf7lbhfPDYSjjCckIXfojzoY@lists.infradead.org
X-Gm-Message-State: APuU4Z9xJlTYJ1ECimlClhp+Hs/anCHmu4dT/Nsyh0vPvcNJUc7cq0qp
	uZYGF9LAXuDmDN69OGmQ78nwirSUR1npvrf1DUDGoTb5NL8SlhGFXXuFtt0ZrVEE
X-Gm-Gg: AYBFou0XbDYoF5s4Dmatw4xDZL0owm40817f+fk2KB5U0d/NsPQh8XRuO+sBlM8wnjl
	p5UEGjXBXBuMk163rVuLiN8H/yXLYFCrvO1cPPD8GdPLkdEHUduykveeJDxebJMTd6WpYmbChIl
	C++g17VV26rMqaJHA3C1Pd3YAbi3JEvZcCCWBnheh1klZhgJeMr6JzoIFKB5D0EUtPDL1f9KiPN
	8v0iD+wKwQQArCKuivrdnqFz76bFv74IXLgO/6ctiTr8d8vXMlcCTor0zx9VX/xMp9NdU6Ua0cw
	+p+m+WuAM2vy/A2w5u7jEI4muHS1lKpNaptQXBaUlccz7w2F3bdHYAYj9Us+V++s51XoPxDXonB
	9bmzeOk4H/1Sif1nqO5YuWG2efSDUiMs7/8tY8qh93jkR2/9fE87kZJUNP3Vdt6KIzmyOdOkBAt
	cMKTInUsDeFJSDgWE8pj+/hFPnwhJmwyU+zN/BCf/kFOm0ZFr2ze3GcEj9LQhqn7plF8SoXYlBV
	G85m3cgwkg5Vtk97lKHREss1s4FMbYy+UWnoJQO1gmUI/jJyMqZFMUxl4FA1syE1wmmMKA8P4cR
	MIO5TO7rwnWqc0JC9f/uEn4JboWtYqbdBoAFheE/I2N+7C6z0kWaE8VE1cHZdZE=
X-Received: by 2002:a17:902:f644:b0:2e2:f379:82b9 with SMTP id d9443c01a7336-2edb924c692mr24302405ad.61.1794316877150;
        Tue, 10 Nov 2026 05:21:17 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:16 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 0/7] fs/resctrl: Fix some resctl bugs related to mpam
Date: Tue, 10 Nov 2026 21:20:47 +0800
Message-ID: <20261110132054.3702-1-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_071326_202065_F82990B2 
X-CRM114-Status: GOOD (  12.17  )
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

Fix resctrl RMID allocation to report a retryable -EBUSY only when
the target CLOSID actually has RMIDs in limbo.

Split the domain-offline path out so it releases busy RMIDs without
allocating a monitor context it never uses.

Also unmount resctrl with the CDP state it was mounted with to fix
another bug with mpam cdp.

And do not allow monitor group move when the RMID index changes.

These fixes are split out of the v10 Narrow-PARTID series below.
        https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

Changes in v5:
- Update and split the patch as Reinette and Ben suggested.
- Adjust the commit message.
- Add Reviewed-by.
- Link to v4:
  - https://lore.kernel.org/all/20261105070934.2258613-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/

Changes in v4:
- Fix the unmount resctrl bug as Reinette suggested.
- Adjust the commit message.
- Add Reviewed-bys.
- Link to v3:
  - https://lore.kernel.org/all/20261031063634.1678345-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/

Changes in v3:
- Add Reviewed-by.
- Local varibles uses reverse Christmas tree style.
- Update the commit message as Reinette suggested.
- Link to v2: https://lore.kernel.org/all/20261030092144.1233551-1-ruanjinjie@huawei.com/

Changes in v2
- Update the commit message as Reinette suggested.
- Link to v1: https://lore.kernel.org/all/20261029081513.924019-1-ruanjinjie@huawei.com/

Jinjie Ruan (6):
  fs/resctrl: Report a temporary RMID shortage per CLOSID
  fs/resctrl: Do not allocate a monitor context when releasing limbo
    RMIDs
  fs/resctrl: Clear the CDP state after the cleanup
  fs/resctrl: Stop the limbo handler while resctrl is unmounted
  fs/resctrl: Release the limbo RMIDs when the CDP state changes
  fs/resctrl: Add info/moveable_mon_group

Peter Newman (1):
  fs/resctrl: Disallow monitor group move when the RMID index changes

 Documentation/filesystems/resctrl.rst |  15 ++-
 arch/x86/include/asm/resctrl.h        |   6 +
 drivers/resctrl/mpam_resctrl.c        |   9 ++
 fs/resctrl/internal.h                 |   3 +-
 fs/resctrl/monitor.c                  | 151 ++++++++++++++++++++------
 fs/resctrl/rdtgroup.c                 |  50 ++++++++-
 include/linux/arm_mpam.h              |   1 +
 7 files changed, 196 insertions(+), 39 deletions(-)

-- 
2.43.0


