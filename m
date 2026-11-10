Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176260A2622
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R3YDxAOV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+ZAZK4H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=V2d/3KN9EFLJt2CEmLoiL7C+x9p7wCoQ76zvSrcXGHA=; b=R3YDxAOVm1ZNDbpc7a9VPisJt3
	QMCbWN3Wg2umVFQYrysGWYdRAK6pi/Ugkan4fi9sSzzeHDq8a5O0aPc8+u+4CHOjB0LioI5xy8DCH
	5W5QD8Vlh7RkQOKW3ViRcDdZz1J4X0yIVwvWL//zl0qkikBkvuMkURVlL1dZ30JMmt1a1JMO3/zGJ
	EMZ/8lciOL7dGC2V+MeJX8Vpq2QjABFZHQQX+OWjSN0Ud7yZhmRXhrRAn9dp/DAu8xUSBNGeYCuZK
	OyddEecarLxi05tFi67i/SWXNloS8m6c83W3fiLST2DJopQlizgplewFPMUQJr2hGboZJcJPlAcHl
	5lj1F22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjoC-00000003bAO-3wQ7;
	Tue, 10 Nov 2026 11:14:36 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjo7-00000003b7q-2bqn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:14:32 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so1106396a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309270; x=1794914070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2d/3KN9EFLJt2CEmLoiL7C+x9p7wCoQ76zvSrcXGHA=;
        b=u+ZAZK4HQQJCEHKTubpinBupH4ThvCby+3AHg2NfhAdrUWkkLASe+RTyaJpkR033lA
         EYI28iySrFJd5HDm+bin/db9Pi4WIYkRsvPXIpEsGB5q+yGC5MZRQReNZKjX6QO9hdA3
         rESlVOC4y98xfTYflST4/c3Ncw/XYYkbXikdBQpwjdVgTqMXD2TZsDAywNcb/veYoNBt
         V034skIhGKwlURwGkqYm8+PLIzvRqcSWnkLROfDUX92Ee+AuedjXRxf41p6hs7MM+xZx
         m5oNL5heVGKlOlUHtWdRXdawJvgizb90wjEMGOyRXsjeIvebTfSty77tUsyHFpywVG+N
         7bOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309270; x=1794914070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2d/3KN9EFLJt2CEmLoiL7C+x9p7wCoQ76zvSrcXGHA=;
        b=Nlu2F/JJsLjAh0+PM7o5flvKBYXg7D3Cpvzb4M7qU5w0DpXoU0nSvJJpFs3WjUqxIj
         TSzMEU4eS4FjCnO+8RbsAAcgS6qv1naEBxQtThoAbrVv6UlfPV/s2iJWD48xMRkiAebL
         hUWl6jHq8Q+MW9E7BgGfKliSmqKBdqIOvBs+Bqx5K9uVddagyrWc/KXGZFMEP8F5ziel
         E+NQMVTpTTcfNk5QcfQPGFcKDkb5RujQndxYIbIJYlEjtMz84NqbOajTEXIOnlLY8q6l
         2E/CWDB3zCcOdgglMLbq1OGpUxUe6OmTTbG6B689/j2FIVichCGJGT2j5TO8Pa7Suxkv
         o/Yw==
X-Forwarded-Encrypted: i=1; AL+hErEXu/1izOneDl/WWXWb7R29Idv9qTBH8xDZzR4LMyDyv3zfeiq88d3hzCCF3ojzKLoyrbsqNuclfjpbHsc6LVaY@lists.infradead.org
X-Gm-Message-State: APuU4Z+srZN/VbedIyaFOmhw7lynDdzeSF24sQKJHHRKXQYkXDWPFiZJ
	NcKYttOpAH1xK8aODlpGF2SCFo/vrBX4tzED+Fq1MWbVi+KK/THeZuse
X-Gm-Gg: AYBFou0rV4IiojYNEszjMTQKbrncqWoAcBDZgRZHa/6AmkOF0/mH8Fcf1JRY4ZN3q1O
	2l9LmnNcg+1suAyxhXFsENoSoEGdD0OxkQvHWKZIN8B3d2saOqfPWnNvh5ZzxDO0wRNMofMnM6E
	Roo28gCU6Kzg0lnzWF2iS5dGKZIJ+0ptZKOSfD8nbb3DJLnNMj8zaxr7onzJUnUl2Eo3NIYDfma
	suldtg99fKxjAee+U+0/yGtVM2vZPy89AzSPCtY7XFo3ZBgWyJ8uWBTwn7Yw7166UuV845Dee1N
	tUon+N8ZwD3G9bNQ8nmV7Kp9b05Umf/8dFAatYZ65JjISfzXsslXecdN2wdxj6s6IRvLIN0UU44
	d1u2CC6VKJGbPI8jX8MaSZGrqD1jD134N830JSCa4wNn5wE/1VjsR7OndTOzM+88PqQicDw8j/X
	YuASSkRv1Mjjv4d7kOpq6HeEMRLEqnCYd8+dgMYC6QHeuGBc+N+ncRxoxH5mXq0KQSWE1Qh+Lj8
	JwGbitVzg38XwLpo0ezA6YVe5z/O8U7Yyjcx7drP7PzAbJqJ+yYSIPMXXzC474stonNOJ+IIdsi
	q4ckeCbNO8oqQ8FnDa9MaA8ued8L7wBsagykc4zQadkDrKNoE1RXJgvEZpMw7QNYic8SIWl78yf
	qyXloBPJWQKqUKJSSxgwJA+eUgw==
X-Received: by 2002:a17:90b:1fc8:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3b166ca1c22mr2280914a91.8.1794309270279;
        Tue, 10 Nov 2026 03:14:30 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm3556684a91.5.2026.11.10.03.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:14:29 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Subject: [PATCH v1 0/2] Input: Add Nuvoton MA35D1 keypad support
Date: Tue, 10 Nov 2026 19:14:17 +0800
Message-ID: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_031431_693601_66E313FE 
X-CRM114-Status: GOOD (  12.91  )
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

This series adds support for the Nuvoton MA35D1 hardware
matrix keypad controller.

The controller supports up to eight rows and eight columns.
It provides key press and release event registers, which
the driver handles through the Linux input subsystem.

The driver uses the common clock framework and configures
the controller's scanning and debounce parameters using
fixed register settings.

The series consists of:
- A device tree binding for the MA35D1 keypad controller.
- An input driver with Kconfig and Makefile integration.

Tested on a Nuvoton MA35D1 board with a 4x1 keypad
configuration and a 1 MHz KPI clock.

Tests performed:
- Key press and release events verified using evtest.
- Input device open and close verified using evtest.

An earlier MA35D1 keypad driver was submitted by Ming-jen Chen. This series is a separate v1 submission with a revised implementation, focusing on simpler clock management and hardware event handling

Feng-Yi Hsueh (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad controller
  Input: keyboard: Add Nuvoton MA35D1 keypad driver

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  73 ++++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 405 ++++++++++++++++++
 4 files changed, 490 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.43.0


