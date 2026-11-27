Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730F0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sNCou7kM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+wqTzLg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ffGLnC0aeYuZNoJ1T080BFlrB7SMYKCZd8bWmNL/oEo=; b=sNCou7kMx6COWfD82tuhCNqnbV
	gQwISVhwk878sCUXX9Yu4jF1ANSWEHnhbEuQFhjX9TBextzpFIX7kV4vzTa5BFPxpXgTczMUXD4hC
	cgj29iis56/Flt4REkwmEewoXOm8SLnoS2B89OCtdpQbPZuXv5ANhGzJLio1JIakAeEuhqv7mAbK/
	dGggTEtHc07eBuNEjvsnMAyIPQrWMhL6t8ncPyvv751zpfRX/T2IgeXiJ4hGieChkV+1TXRrZ3f+q
	uBUoJMQ6FnI/DjLN6XzsXYMSDhhpJN7TSe8vCgs+Gy4WJ/Qi8/hJNQvOBkTez0VWGHLvs+bTqyjsy
	o6PKrv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv3l-0000000G89H-1MHM;
	Fri, 27 Nov 2026 12:28:13 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv3i-0000000G88f-24Gs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:28:11 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so4131328a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782489; x=1796387289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffGLnC0aeYuZNoJ1T080BFlrB7SMYKCZd8bWmNL/oEo=;
        b=N+wqTzLg/7VD3kQsCURe6tfqzJor3L8w3IBMF2uoZ1R87dtmBSdoq/UQ+morLgMwbS
         UdHhVF1/OXTvc6wG5U0mDLyktqKNQVAmO+abZtEyd5nbvuwaniIL5y/vP/QiGNTXsk9k
         vUsb3UJp0MpkVF5nlC+jX1AAPyfh2vFXlt3gIuOMFg4xFeKXfE7bphWupNJrWYgLjoMC
         dgQhssjPS/yQC1VR7So/TjQOt6lDlGiIfSD54z+TznnpKV5hPsx+QTrjI6EeAzZQRVZs
         Dmgrv/L/ZyZbzKn2fopOqRv+IWHtLvSuDfWeHAZ8PgnF+xd00nhmCL5z9dZfZ3oiyehy
         FwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782489; x=1796387289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffGLnC0aeYuZNoJ1T080BFlrB7SMYKCZd8bWmNL/oEo=;
        b=f6iE7tCYo3E2K9Gha7Og7PbjAVI2q8QZIrjUlForFr1jics130k9WvCfqP+HUjrfGa
         shNmX4l48tVJqveWVCzlrvRI/VxVA5jXRhEseTZhKTzHNaI4K+jEqog7BKOCG08ma0mz
         q7ZyC4P81A3FiruU/BTAFC+5NT30X6mkA/mFM7CrtRdMgdPG8dMJM2VGKW2FOW9qIxGx
         U/3fptZiOMJh83IZ0JmLAQ0mzWsiSloZgIFAHxgZFlR0DwhNuUIH+WVYdNh8Hgh0+27O
         hLkifhf7JL7J9Ucb8llGh+yh1dKAG3ZCpgVJDKy6sFMDvf4ESxfc2QbVYHpx/QFtqfgP
         8viQ==
X-Forwarded-Encrypted: i=1; AL+hErEzRd9BQgRaswmYP3wxcOCJ27TGnC3FzzPNPl9M0zd8mdNwQ98BlhShHdCrPSa1YsgdGsigp20XUCvFPl4cD5Lm@lists.infradead.org
X-Gm-Message-State: APuU4Z8BkUUlj7x0gl0vla2ZoRtUJGUkqI/kwesqhvLzfGkEFoXITogm
	do1VVTrrUDTqHGrHbuydXgnKzS+VTPcLykIKLxJ6vCs0aKx/INmCQy0B
X-Gm-Gg: AZFdTZdke+NZwxUlKYkdv0xTP9GTdvWYNRRfzataEn/H6cno3gJFg39hOFxQbUcSQfp
	7X3+tJ+RRSyRVV9n9IUU4Ofl9AYCh0653BAEw2T7u9JdvoyQaHGLwz4CqIy37VZeG49qIRZdRhW
	hE2povaZyfButFzSBi5854ocdBrvhHS05QEB/KOXMhtfDXbgTbh5DEGJ1lUUKIarLxfK0wGBfNu
	O2P799R/4PagHYmFeUG7buaIyTgKICJyDwNJ07vDn87GUW60l94teGnwSMM4bQgwDoqsQDmDXnP
	wPmq4VNiZEgn6HnCmvM0BFRwj8nUtJj5/uBMDAsy6Ihw313I6/6c7K6+QrV5hMhLWfAsar+UlyB
	Z82iwKuPuY2GGGv3vdqgx1309+bhdZ8rGLh1VqBNCXti2ExG6/Lx8F+teaYZVs+lB6LEz31GmZs
	GaS5ZDscWiL3y/7AztBvqybpKS/UEUOPxujj3e51eq/G2SGXdfLGGhVxI3eJyVN8QnPfw1QrQXc
	SEtOSrrb7dR1zcm+IjpZ+sAU65iCxLFmEVwvXclml/367qTRH9+Ig1oCv7QLpnVy51t47JTsYNm
	gR7VjWuS/XdgD5uGINcbtHSGvhhg+4jjugh/nJ7MGGUYbuEgMEPy5ir+1gEWDUdk4uz82XxpYZq
	vA8+NNrgUEnLJ65zogFuF9yjkzVe3/zHpzOqUSmygzg==
X-Received: by 2002:a17:90b:2ecb:b0:3b3:acea:46b6 with SMTP id 98e67ed59e1d1-3b41c95e795mr22986239a91.58.1795782489182;
        Fri, 27 Nov 2026 04:28:09 -0800 (PST)
Received: from envzhu-ertl2024.taild6e5db.ts.net (115-179-78-224.aichi.fdn.vectant.ne.jp. [115.179.78.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm25088215a91.0.2026.11.27.04.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:28:08 -0800 (PST)
From: Yoshifumi SHU <envzhu@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Brad Hawthorne <brad@sim.vu>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yoshifumi SHU <envzhu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Revert "irqchip: nvic: Fix offset for Interrupt Priority Offsets"
Date: Fri, 27 Nov 2026 21:28:01 +0900
Message-ID: <20261127122801.4189591-1-envzhu@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_042810_532145_4CDE5F4A 
X-CRM114-Status: GOOD (  11.70  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit c5e0cbe2858d278a27d5b3fe31890aea5be064c4.

nvic_base is mapped to 0xe000e100 (NVIC_ISER0). Thus, the Interrupt
Priority Registers (NVIC_IPRx, at 0xe000e400) are offset by 0x300 from
nvic_base, not 0x400. The reverted commit overlooked that nvic_base is
already offset by 0x100 from 0xe000e000 and incorrectly changed
NVIC_IPR.

Link: https://lore.kernel.org/linux-arm-kernel/b0be3be5-3a7d-469e-9166-a3414a52cbea@arm.com/
Fixes: c5e0cbe2858d ("irqchip: nvic: Fix offset for Interrupt Priority Offsets")
Cc: stable@vger.kernel.org
Signed-off-by: Yoshifumi SHU <envzhu@gmail.com>
---
Vladimir asked for this revert (see Link:).

Tested on MPS3-AN547 (Cortex-M55) and EK-RA8P1 (Cortex-M85) hardware
against v7.4-rc4. On EK-RA8P1, confirmed that the driver now writes to
the correct addresses for NVIC_IPR registers.
---
 drivers/irqchip/irq-nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-nvic.c b/drivers/irqchip/irq-nvic.c
index 2191a2b79578..9438891e66f2 100644
--- a/drivers/irqchip/irq-nvic.c
+++ b/drivers/irqchip/irq-nvic.c
@@ -26,7 +26,7 @@
 
 #define NVIC_ISER		0x000
 #define NVIC_ICER		0x080
-#define NVIC_IPR		0x400
+#define NVIC_IPR		0x300
 
 #define NVIC_MAX_BANKS		16
 /*

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0


