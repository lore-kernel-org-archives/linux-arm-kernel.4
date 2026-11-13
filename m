Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB360A6F7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GU09w+YY;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HJeYGorc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=; b=GU09w+YYixQ8N/NNcMgHM2gOTW
	2Am8f+KA6jnubyrbBK8OwC2a4qph8pZXDDUMA/RnYWpNpGyFekQWa2+JIBHbWZytPUic/GiDSZFUz
	4IpakJNbwE1J3RzasKRZuVLln8Day72VM8HcRXEQmnTwn7d3lZZ9B4yXt0QaksYnYKMw8MMRPcLrg
	HDRKOFFqo6bYZJeXLwK7Ei+0RldicKyMJtRmSSmggB0Bz+KsgTEsIPdlF7odvCOv6bf7F9T/miotw
	KrS9xfXEmVX1t7ola1lAQrG8pFN0ogDtn1NV33oF5Q/YQol3IkPPvpfaUyhb4HgRnSmy3NSwSSp5Q
	lGlypqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6a-0000000CSr3-17qc;
	Fri, 13 Nov 2026 11:06:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6X-0000000CSpW-2tUM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a215e64962so14100335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567959; x=1795172759; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
        b=HJeYGorcuwNDe2fkiBPVV7ZRy1I/HHvd8Pc7neJCHns3x1D4C2dmnGv4XL0VtTn54m
         rCPAgl3xJdoFV4i6RPPAiW/c2FQgk538RmqPvu8eTx3GogNIS2Kf4czGxQnb/75BPcZE
         Hx+bklFBn9ZxjFJunpEN0wOVNjZ755xwrVBY3Q1rssIsVO+1EyJnzuoLHEpZkLGaU88K
         7rxRvdZzceGnzRyapBBM4IUDOer+tsBMGnznzHdi+nW91BVaCW31n+t6zTYPxhBKmRIw
         7lLmTo7CxIgrPsRte6VICyOez0pNEu6JlAV6jg/SaKST0wsQeYSJTrjab7LpneR3XDcv
         Chbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567959; x=1795172759;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gzZov9JPSIe7T13qi6SZ7Yt/1lSfrV+lnshc+GEkjQ=;
        b=tmjAPwg67ldwacY6Dbm5EvZME5avfkNV+21XQmL0YocqTFRkFxJd/yoJ/YSeDT4iGx
         9LRMtqRZP6SkQPloINWPRPGMgXSMLw22j+YZixfsqHDPZ0EYUYU1oDMkpAz32mc+XBMC
         3Mc2ddYXiSqkSdnmBiWqOJmQ8ZJzqiuOCrIhNkCDeCQFx7YUnMN1FUWBrbXqX0u8IPku
         En++lWL8k1Q0vbycF8cYomgvW2d12BLw/NzoDCOEhMq12Io5/jKJt6UYfkDI+0EJGSMQ
         i9txZ6I0E8I26gteshJOb5qG0UvPD5yHa3EXi2kRcPXBzpw8t0sAUpnp/wK3/J76VNNu
         h75Q==
X-Forwarded-Encrypted: i=1; AL+hErGX+wBl4avPFmHkIQ8C9HuxExCFI1j5bhhdMUJfLEgIIYk8JWTPvSYGshppGdP1SpdacmLDONoezyA3z4XXDQO/@lists.infradead.org
X-Gm-Message-State: APuU4Z+MOwcd6Q7X7sNPgVfI1xNDtEjQ4O/DEuNB7i0fl/MUnuBb6bsM
	Zo8aMFl2DP9ozgk0iO75KBA6i+b0YYVdKgUz5Gtk7XjmAtksmEc8bu8deNKeuqCiiaI=
X-Gm-Gg: AYBFou2aaBfxOwCUpOdJK+1KbTTD9NgygKz4oeKTKd86kRM7y41LMKsR0Lfpr9dzxT7
	V62JOEXWhYpJslWX3wvusl2vDJc59/xqqXyoCK+a3RQyKRhdMmCklOf9XAKry0BAbjMGO6hoadN
	tMSeNnyPzNfRS4hrAx6DWOezH0arTWWrNgGcMIn7pGnO7nSnr0aQrMwmCePv2T88Ksu99jx6ZAn
	Zy3eAuH5YTuaNJcH+QI0VGMmICHns+aXDMhVZOh7XGfwW+L/OS52fbkbDnl/sUH12buK/aiubhs
	w0ulyXJsSeilng0r1PTc+EbBs+WgDpMrRgTa/Do6iJeehjSEcB49iEEptewQgMfiFrDnU6DEsYv
	sLCdOB9J8QazthNZiGOgg7jD2iuRzDk9upMTRlPanWykCrT1GuwC3IiINBzT3xeEMOjdzEWDf9U
	5DvwwBB2ubo8s/lZlyagv3RFW+4FYog+JFUhxGL0sBvi5Iqj+dt3thFdc2U6PAYfczdtqF4ng1z
	8ucOUI8SDlPwFWfZeT3D5SlXtFR667mNUpRXzn9uXQ1oH2/kRJG/+PdQZ1JA5AU5306bMkIoEv7
	5HyAylIHnET8mOuafqwASpeyKyw8dx14QCEkhs5mqx0AiaSkuns=
X-Received: by 2002:a05:600c:6219:b0:4b7:6aac:7406 with SMTP id 5b1f17b1804b1-4bb55a23b41mr38480235e9.3.1794567959161;
        Fri, 13 Nov 2026 03:05:59 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5671059bsm28648085e9.1.2026.11.13.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:58 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH v2 00/11] pinctrl: scmi: fixes and GPIO function support
Date: Fri, 13 Nov 2026 12:05:26 +0100
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPfu9moC/42NQQ6CMBAAv0J6dk1bUMGT/zAc6LKFNdCSFomE8
 HcBP+BxksnMIiIFpijuySICTRzZuw30KRHYVq4h4HpjoaW+KplKwI4aby0jDOxwDB1E7BmagT1
 kOVqSKjNGKbEVhkCWP0f9Wf44vs2LcNyTu9FyHH2Yj/2kdu+/06RAwkXXhc6ztKqL28NUc8cm0
 Bl9L8p1Xb+9sX7x2wAAAA==
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030602_044259_C60295FD 
X-CRM114-Status: GOOD (  12.04  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Five fixes: the drive strength went out in milliamperes, the schmitt
trigger enable was mapped to the input buffer, the settings Linux
carries without argument went out as disabled, a setting the platform
reports off read as set, and the protocol layer read past a
PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer.

Then GPIO function support: report the pin-only and GPIO attributes of
a function, give pin-only functions no groups, mark the GPIO functions,
and select the GPIO function of a pin on a GPIO request.

Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
the schmitt and enable settings, which the platform does not implement.
An LLM was used to review the patches and to set up the tests.

---
Changes in v2:
- patch 4: keep the enables value on get (Sashiko)
- patch 5: error out on a truncated reply (Cristian)
- patch 11: unsigned counts, loop variables in the for (Andy, Cristian)
- patch 11: dev_dbg when no GPIO function is found (Cristian)
- join the lines that fit in 100 columns (Andy)
- collect Reviewed-by tags
- rebase on next-20261112
- Link to v1: https://patch.msgid.link/20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com

---
Clément Le Goffic (11):
      pinctrl: scmi: send the drive strength in microamperes
      pinctrl: scmi: map the schmitt trigger enable to its SCMI type
      pinctrl: scmi: send the settings without argument as enabled
      pinctrl: scmi: report an off setting as not set
      firmware: arm_scmi: stop reading past PINCTRL_LIST_ASSOCIATIONS replies
      firmware: arm_scmi: report the pin-only and GPIO flags of functions
      pinctrl: scmi: give no groups to pin-only functions
      pinctrl: scmi: mark the GPIO functions
      pinctrl: scmi: report whether a function is GPIO
      firmware: arm_scmi: add an operation to set the function of a single pin
      pinctrl: scmi: select the GPIO function on GPIO requests

 drivers/firmware/arm/scmi/pinctrl.c |  51 ++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 161 +++++++++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |   8 +-
 3 files changed, 201 insertions(+), 19 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>


