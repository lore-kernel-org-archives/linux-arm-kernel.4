Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81ED606A890
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k4x+GrhX;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ev7eE77o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=; b=k4x+GrhXLRCqK4
	PLBC2mDD1ZVd7KrSChCIiSUpHFUmW4amQuhIMnCoMrJuBAq2DUivfZgvpXtCZuHSMF0IR7v5J9WMo
	TuJMmqyB3JNkMub5fmLuKEir3Cdy+jDiicpFFb38+lplZISZTTU3kscgn1UjQO7s0iEYYeNcX+TYm
	IyaNZxrA8RljgaTdwTX1nVDhZOR9ILPwBYbilN0EIk4RshXQ7L+cqSAfxUdqPN82ZyfZ7teg4/p9m
	mQJ0S1O6AW1DsRbsKMf5lhTGBSI4G21hFxe5+ZwhJyjabkOt394nkfcTF7rlpnCS9SNmG5WMIl3iB
	JcqMSrHVG79ovRRGrQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRupw-0000000DhaB-32lP;
	Fri, 13 Nov 2026 17:13:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRupq-0000000DhVl-3Ruf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:13:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e10a70540so590037f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589989; x=1795194789; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=ev7eE77otx11bFO4yDSqVHJQ6PCINMdTqpJMRISoajwN8vhe0jGeSlkhsVUQ4VV5P+
         Tq2oB4x8vGet/k7pl8As2N1CpVVJ+xy7oILT1Ixn9SU1C6/bGXrXK0lXkYdyGcpRH7RL
         fEwrFc84KiVIJCk9cMc/oB2+MrwWZT7bcVpcBJ32S8s6+nJR/DAoZd6CiHnlPDHg7Utu
         UOZC98rukj2bNDs5gtJcyU0C5Mygmua3CxjYhq+GcRj1QoRc3jpKXLntOJeebly22ORf
         thPdZRY6qVdwLIh901s1rpF2XfwlYnWVHyLb1GUbUDOmODR263cXMKBZTsvYnWj7wtNC
         JU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589989; x=1795194789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifsfeTgNrl5URRYKRdF9Ak2jWUcinyCSFoIExBuQmMQ=;
        b=RXWq8PpIHzTpF99AwOTaTeNT3+fTT4kuYh4/0YzA6E4UW8KPJM4xZ5XykGQdnubqyc
         1SAZ5/HMl5NB+zhfdoHrNZM1VbirUqsznLAs8CiJq3QkDFA0KyankcNTuhq0dmLvNK9d
         +Kyp3yJWxt5fsdP1O1Igm/bXVlpYpaCXrWSwql3ve5VVn7tdekuJB0wk6zTCkHOLi+T5
         ZIZD3Bl8Do+dYrTM2pvoceRkxhXejJXJQWhuxCgik3h0dImMZXksRm0vkzSZY/plx3Fz
         sAAYmCUgRWJIDGrMw3+3eGC5krUzfHTL0y8hwcVSxB+gCZGlaIFopTjzzo2FZLqTW/Tu
         URIw==
X-Forwarded-Encrypted: i=1; AL+hErH6DwMoLcLBOOG2mlM+PIAbi3M/7qUMkiqD/lZ2sqmt39yja9gY2QyRz69MT/gBXuYMm04fuIZYKLqXz/4/Xv9m@lists.infradead.org
X-Gm-Message-State: APuU4Z+tW5N3YTzBZshKx0sIE/Tx41POM51r8y9ZbUmIfju840/EKScs
	aanhjR93jsgYQ4wDimPq26Fe/jK+h0KVGfomqepK4eLrQIdZXRJx2EtmrPnVNwVbibXG
X-Gm-Gg: AYBFou0hA2lnxs4+sxANOKg6TKkBKsnFVp5r690pwB3YpwW082cEZMdBGDZDzyUdKGb
	QM+hQ7Y4JnqqucttRrFqHsDceKBOLl8No1mrlT2ZfOco+Qhxkr+jGZee8fqV+EBKJboNYWeGfO2
	yA7ppqfNYAApRFtbfIZKgb6PomkZmRO6rkpJfRzQjI5Jdg/S1h711wWvbI7DW5tcflyK/yYUT9b
	4jqanTeNUUm3/d1xEqqfYlYOUY3FI3X4bht9VwCC1JCq+iXgbJDrhZSQsXa0Hj+53laN8aHDG+c
	1bD+xfJjxCPM4rxS9FPBl2v2rWEzrvebQseuyWUYv7gAGHI0uV/+7dE/dONhDPkylJoJffblIuX
	wjkAfQa8WudrrzEg0+nYiSO0uIXKEQXpeMI2qgkgr2pZ5fikiifD6ccEHjzPgGIbBQNP4ECA1Ta
	3NiVLv3CKEhUjkzQmCS2UC2H1GX3J12rlkZP6cckX+Fh3HV/txqUR/MvOiypTFcTD1bfraphIC6
	VDvpyQMzOq6dB+20L3FaIah+kB2ZsDF30JTp9HoeInTNYVZmxEQA15QdEoMwf5tJZkFbUxTY0FQ
	TPqacDEb4pDNNtVJEEJJng9Vs9CCgDYm2A==
X-Received: by 2002:a05:6000:2f82:b0:48e:4e3e:45fb with SMTP id ffacd0b85a97d-49c73631148mr6928682f8f.22.1794589988794;
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:08 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Fri, 13 Nov 2026 17:12:55 +0000
Message-ID: <b50bad38d3e5c045c1c671be4c520c13760c5e38.1794589639.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794589639.git.jpeixoto@osyx.tech>
References: <cover.1794589639.git.jpeixoto@osyx.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_091310_913542_65485567 
X-CRM114-Status: GOOD (  10.18  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v6:
- No change.
v5:
- No change.
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dbea081447e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4712,6 +4712,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.53.0


