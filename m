Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8000606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U8zqJqF7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qosrpo2r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0NWssteZPPVU+nMk7IUnyZcBf2kF3Y2sa8v4XCIsjDk=; b=U8zqJqF7xnWESVyMBHzwuZqjQs
	tZMOoTB2rWb0N3vdjsBBAi1qjJrRsjbfJFLx18D+Vav3xCzqGiCRMGHfgjLNRR1/r28NF7qY7sxE8
	lcuYkmddgHYrUAHGc1Q7TYMFvXRuQqdZV4wMQVeKopajOBj60LLkvWYCU/nGC7bHPvRbbzypNaYuS
	Rd1dUUuTioadl40AuyqShS4CeTLLHpFw0RYFk6jHsJBKRIYRxl95UE2ur//LGVYnLzt0pmxbKryJ+
	f7vm3rZU2ulfilceZnoQk2KT+LEFqMMdt6zSRHbWeCBVMpr2W7Ygg5hCvnB93N8+30dAy6qDd2Miy
	ORdU8EWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4FU-00000000vxd-0rAp;
	Sun, 22 Nov 2026 09:52:40 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV4FM-00000000vvt-0T7d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:52:37 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so2200014a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341151; x=1795945951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0NWssteZPPVU+nMk7IUnyZcBf2kF3Y2sa8v4XCIsjDk=;
        b=Qosrpo2rJr/zZ5crVOJD0e3Uzq9uG3T6KYSoPQ3tqR2hG5J8inunqlDfHY9ebqLmh8
         kDW6EhLlpiKS/9bpltKEuVH4OScZji5C1xJckF3hRkBJb7tom+IBmeGAVtGGzLh9c6hP
         Mpceufp4VFdMtBjRE+ZydvsQdTgS8LAUtwdfijrggxhCXQk6Mpkwwi4TNCWBiBTmKAT4
         Ic1Anr9t/z0fG4VdN/2EE1eRN8nN5D2vI4jtXdbYXTEhxCipCtUIftp5kDHGbBDxrcJm
         3niRIbaygPCPY6Jhu08S+alJ8hzftjrnlkiIUF5DgF3LwXCnZW1pPOWLUr1czkxNdpil
         07DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341151; x=1795945951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NWssteZPPVU+nMk7IUnyZcBf2kF3Y2sa8v4XCIsjDk=;
        b=OYAEF3X6ayZaIHNiNq1PsEdCWMebbR2+xQQ8JOWf2MO/J6XHGJd0hs3i+WJQa6sqMl
         hWuDE4DsgkBAlkGUSdX0SD0B1j68vPoj9LDpeL3RKF0In4n4llFN19n/ATWTQNPIzgZH
         iLKrvXPqzU4XGQSojzLVdUscBMRVLURLFvrTSP1zWtDATxLA2yT6FOuLMTKZ4eyJzCbL
         66jJgGOARoKP4Imi3VmtHY8ZvDOcAA3Q1ROTgS8gVizfbSLYEdlZjakLIHcNkeHg/nQu
         ayOgjR6EKXZue23o4klsD29910Y8Hv0lGobA56AjVcf4EjX+WHENd6Q7pkQDsNlVDLSt
         twRg==
X-Forwarded-Encrypted: i=1; AL+hErHZ/DAkXNqU7pCHp9/LFjWz9IlqM5o9cWsb1i8PRcJwc/1I6/ug9rd9EwxX0RaL3R+dTJsGW46FzjX4fFB75WK7@lists.infradead.org
X-Gm-Message-State: APuU4Z81CKLVZ1Ha/rKLwWqMUU7WJaOAkz/OrCTjAtRY6IyhJh0nV/9p
	GSHDTP3vDlSCy2D0XexRs621I153Lrlsh18dWAymS+WSxSYP5+aJReFP
X-Gm-Gg: AZFdTZdKdlGw9MODlll3J8B+OHn3tEqWaRmw8LnCcNpQhBwj2+fdN0yvKybWpa1mdKV
	gWCq4ykEE3M3g1CnhhHOW1Eh0dc4uViGGKwVAnveAojkGFqPn5K6GUZ9paR1MKhwfI/istTA6Mk
	vg9xERzN+m4xSedsZSAIqUUd8i//sVcFC1mGgZ64GzNgnoRDooBou5qmxjobUxH35jz5FHezDZE
	gNsvkvKyE4BnVpLIfqCnmQ8womxZZ1qERBLfsi5Px/xfMn8GZvwR7QNJXPXmMZhPm8/MwN3U+sM
	jIfADVC5o4iHI1TI5ZNy+jXpNOIfLXCv6ABPSrpLlMTRfzyafRtwfY8FY9DpZW5DEttoJck7nwu
	m/v+r28OKDUltdW+qR/1EiliPVIlTy0rsOPtLkJ+JMs0c5jO9nV970I79WXfRNxz0LqqRmFomka
	EyxdE0B0ZQJIFWqoMJuZXfhSioTOekXCCS3PI4ew+acOL3QA4WFgt8cjAygTpItQcEuP5afTdzV
	PQni+kd1OnNppzHvy8NKYrSund3bfXJU31CTq63YyhNS5sVlWePIN+NXNJMDgFtqL72hTSG+Jo0
	O5MwrRZqxNbBImFkok6I9FVTyIQdGaBun70mv8G3bA0rHdJf5kk=
X-Received: by 2002:a05:6a20:ef0e:b0:3e2:84a4:8875 with SMTP id adf61e73a8af0-4014bc52bf0mr6906650637.53.1795341151175;
        Sun, 22 Nov 2026 01:52:31 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm3289722a12.18.2026.11.22.01.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:52:30 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 0/2] ARM: dts: bcm2835: replace deprecated LED fragment
Date: Sun, 22 Nov 2026 03:52:23 -0600
Message-ID: <20261122095225.200916-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_015232_143353_A2717B25 
X-CRM114-Status: UNSURE (   7.46  )
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

The Raspberry Pi Zero and Model B device trees include the deprecated
bcm283x-rpi-led-deprecated.dtsi fragment to define their ACT LEDs.

Replace the fragment with board-local gpio-leds nodes, preserving the
existing GPIO assignments, polarity, default state, and heartbeat
trigger.

The changes are split into separate patches for each board.

Artem Novak (2):
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Zero
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Model B

 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts    | 14 +++++++++++---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.56.1


