Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F3606A889
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b/GFrTt7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pDV01sby
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=; b=b/GFrTt7U54hgGa242AUeTPNdy
	UcmdrpARMqhM5Ukhd11WCbLF6EmGlme07w6GFnXz/2iYF6j2kqwzh8GAa8XyhE+qHXQH2OXsTEp+u
	V/jRYfg5589I4X7OQY3cf94cgy+T0aYjiDsc9DgW+8kr1G+3TTMnB37dpiqhw/EkmVg4y0F7hvR6J
	bSHfP86EGDpMAhTV/rrfAMfWJ4gU5xi92+7AYj+3rScXqaLM0B3xky6Ul6zgrhmB1MSymvMp9rMqh
	7naVMNsd7HxiEiYbpZLXOVJPFLVsHMvWmbQwUT8vhF4ucmYpaZlRBY+JLHvXtZtWDTNlc2urReSiq
	Isl3m7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZU-0000000DScX-0SUC;
	Fri, 13 Nov 2026 15:52:12 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZQ-0000000DSc2-3yVz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:52:10 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-7cc013095d4so309625137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585127; x=1795189927; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
        b=pDV01sbyySZSwfNbdI+RYqe3E0kHsw4VKGtWuQ7VffNtKaJuLrZkuPyI5sNt70ZPa7
         5yYzC8aeT0J9K5MLh3XspXkC+5/EmkTt0wwxdDyyeFX68DsnHbcrlzWDO3SxWk5NipHs
         SJ7QsIRfnWMphotXZsoeln/1+xHxlTymJJPoHNw8D0VWPenDR0HdUYaatkY2CfCR5tAh
         5zdhl2c3egC1l0UWIJkA0thsyMRGVDr8908xg7KafTDkbb4TsfiBX4hDBcLJAFd9YhNP
         BMYj1PfTv8pog3xGur9xph8kqiJKvM4L8c4cZLbXl51BKNmindzYpqaorPyJufC4T51U
         4t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585127; x=1795189927;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
        b=uf67q6v9QWRAu+UbHae5CBJJ1b6RcwewIm9YJiyx1bE7dE438WuO0ZUkcL3So9yknb
         Q7Kq4DuWCwIUdeTiDNQhK0otre+4lo2pugufDY7BQbNHJFXiK0F4XIsNYzO+Wgi+Jafa
         QwEKntLjRH5TnYSpWvkoTftxR/SxOM8E+ZkTZj8tH5xXj3HPVzHMP+llfYDP/iO2DRJN
         ckjDv8pMQ+c1uz5NGB/T+IcTgzBXBv+uHGa80WTHuC13gRRhLFZbNDpcw/IKFo3VsbWL
         Uyd9OhbqlIk6oz8QCNMTynEqf10SXeZ5J+MIWhSsbmP72hM3XWsjT/FbFp+1Wnkc6Wud
         rD8A==
X-Forwarded-Encrypted: i=1; AL+hErHFNpV44H+913j2732WDBFGLgBn+kL/V+BfRwiuco+fOUYwjq3c+QHlBTaKa8NZUU/VFHQGzdERTh3Bsu/wHtNK@lists.infradead.org
X-Gm-Message-State: APuU4Z+Bo8ammtFMI9NeEwtMwe9DiIgyamsNUbbpGhrnAdIHcuCycIgI
	k9xLolJnXZpC6fIeUv7js791uT7O39t6N4Z27gyae6JIK1yUHWHnlqek
X-Gm-Gg: AYBFou3yt1qlSZNfaSi21LtYdVylMGyF8BU+3/HL3/uumLDeR77O+4ecfeVusVnWzGH
	TSaAxePUX7GLF9RBpRCHGTOrUY3sdhkMGLljcT6QvdfplDADUyZxfUaNWAn//nSc2VsCNMPIkn2
	DCd0KaGrv7cMWx8YMksve978zMg6o5N1iDySqAMXeBRJ8UMa0+6PUldTYoDOvx1mhPTlwsJqW56
	4tsXNzyJEh375kz7tUY9dhK4pv7/A3/Wvx5OGjdtCIyPZLGlobZTlVNBywqx6pMxcC1MsZDI8e0
	44Ae+0WiUxU8/li5edaVoOdkzK+TOBryeTGvNAc6NhRR6hq15zQGJj5OD+86/hFDyi02u4DOUpX
	Praawa8FbHiEmCLu8gy+MdYjnZ+nzwzgp269fppABmM/CPoNVhHol/cH0fEZ/GLB9meluQaV2dU
	XejaZYCNVdA/aFkhpWiAX7zeA5sbNXicI6JOscoMnEfbPJT95NpWyVSRIPNMGM2XOa6aiYljnYi
	5MZ+QxX+NF5QQksrYX3hWGGmTr11eNqmek1LyGNYhNeulFXiJm7ccCtigvafxUhcYsWnWEpTwbv
	JppxZSouDFxFAY79E6llcnSCAB435Q+U
X-Received: by 2002:a05:6102:f12:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d64d84030cmr745103137.27.1794585127400;
        Fri, 13 Nov 2026 07:52:07 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:07 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: Add SMARC iMX8MP display
 overlays
Date: Fri, 13 Nov 2026 12:51:11 -0300
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO8x92oC/y2OQQ7CIBBFr2JYOwZopOrKe5gukBmUpEjDVFJje
 nexYTdv8vP/+wqmHIjFZfcVmUrgkF4V9H4n3NO+HgQBKwsttVFSKygKbI6AM4PPROzsWDNxOcU
 J5pQt0gIcbXZgEWEsyICBp9F+GFKhvB1W9x2dJXmHKOrUlMmHZdO4DZWfgWvXZ7Mq6v9tAlK38
 rbYqoHf9xjmv5wEf+xPznT+bnpzbUoHl6IY1nX9AQyXlRHxAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=2798;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=1WzCApbm/N+lfLdjiZlJyPKQ+4AjAxmeXLq+NVpvXao=;
 b=yf3UBTTx8wHqJx9v3Stw00xASfc5loBUIuwai4kXTRF28vEGBey+xUGDbjXMB+7XoaGW8WThW
 ZmnAr1ndRq4Di9YRUlBeIFYVWcS6SaUNovwo2EBPH2mYxweV+v4/Vz1
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_075209_003031_C1B84ACE 
X-CRM114-Status: UNSURE (   9.87  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds device tree overlays for display accessories on the
Toradex SMARC iMX8MP with the Toradex SMARC Development Board.

This brings SMARC iMX8MP display support in line with the corresponding
Verdin overlays and makes the same Toradex accessories available with
the mainline kernel.

The series adds support for:
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive Touch Display 10.1" LVDS V2

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the SMARC Development Board.

The DSI-to-HDMI adapter, 10.1" DSI and 10.1" LVDS V1 and V2 overlays
were run-tested on SMARC iMX8MP with the SMARC Development Board.

This is the v2 for a series previously sent by Ernest Van Hoecke, and I
am taking it over on his behalf.

Changes in v2:
- Rename display overlays to use the "tdx-" prefix, and add the "-v1"
  suffix for the Toradex Capacitive Touch Display 10.1" LVDS overlay.
- Add the Toradex Capacitive Touch Display 10.1" LVDS V2 overlay
- Link to v1: https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com/T/#u

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 7" DSI

Leonardo Costa (1):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile             |  20 ++++
 ...arc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso | 123 ++++++++++++++++++++
 ...marc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |   7 ++
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  80 +++++++++++++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso |  98 ++++++++++++++++
 7 files changed, 555 insertions(+)
---
base-commit: 45327d3207619a05bfbd7e6f2e116285ef726933
change-id: 20261021-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-a273e90efcdd

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>


