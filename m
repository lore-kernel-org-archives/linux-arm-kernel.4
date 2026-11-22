Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF573606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iMlxXBy2;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=n8AbywU8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DKG2CDpDJjCN3w8GhTWY2Le/K5MhPR+ZkRtKO6JJCzc=; b=iMlxXBy2+Wj363IeQ3gSHnfD8Y
	8mQ6hYioHbu7vgWr9iwp8t22LGcJdbcQl2FUs3eITHdu50UWNBeNGpr1SfwOK1tEDncOSpH1Oj1lD
	K7INPLhsFxq6eESUHzpXQazcaLCXWMP5EMg/YA4KPCXbB7mrWoyYMizpi5Bj1cyMAnGjuVO/hGwer
	jBelQH9bPgdgwkEGrC1tiekLZYey5O4aoED8QXLByeSnydU4jWK6s8fr1Y/DGC+AQx2OHTpesgiV4
	bLmY6r5OnbWzQrn7jty3EOuBzRWpx9gOnIUb/hgWnoLbXjs8gI++tFo9L/L5YnhJWWT0yXGG/9aiO
	C/P3G32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXO-00000001jqT-2SMj;
	Sun, 22 Nov 2026 20:51:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEXF-00000001jnk-44jh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 20:51:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so23603315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 12:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380700; x=1795985500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKG2CDpDJjCN3w8GhTWY2Le/K5MhPR+ZkRtKO6JJCzc=;
        b=n8AbywU8AWrGK8rcD96znJtHpwas+ozC/NYerUOsmKXLPQcbunfQ/1hWIqL7FbbD0s
         xwnmYXQaODJs+eD8zQyxmmY6mITUZxjCqvGqKu1jpig4X5C+B3fWFyJmlxr4fnWue7YE
         J5Wk94txU6lTLNqzgI38AW73sgrHTf+BsFFXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380700; x=1795985500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKG2CDpDJjCN3w8GhTWY2Le/K5MhPR+ZkRtKO6JJCzc=;
        b=Kl5tlGBh+d1nG4GDDAB2GW7swQWEPWktGjDnVF0jSz1qRo2eveeumI2ZcJDIJksQwo
         mYsOqKns5TLOihotszAgzXh7B3oYW2KXGw4nCjgu0nd3RO8aLljhFjrhcSOXU4OUGcyl
         djv1thwX5vNKNSNq+MDbUgfpZtpPfxZNSGJKp0qGCAmmC78mZewCFmQ5GSgi43Bmtawh
         GEZ6tPCTRMuZz6UD2l3mH/wjNOQMzsmDFEQS9h3pfMyTRMh7MuHNqYfsEa4ohTf7pJeL
         N74kR9slD3WtTVngosvcne6S7glwrFK4SHW3C+z7Cs1FixnFUn9MjqcA+K5GorMP0wHz
         jeSQ==
X-Forwarded-Encrypted: i=1; AL+hErHhtaZP1Unt2nebvhj9ysIw4pI47c2tAszOm8dOrvEgnDpa3y9vtfOTjcrh7K0pb80LMcBlk7J/oQjvjf6Y2+O8@lists.infradead.org
X-Gm-Message-State: APuU4Z+iHbkL3FW9E+Q3B3TCwC54V8lYew/iIjFHZAPSn5CuZoY7FoMa
	VYzi5SDgFr29M8grlWW/2pWjpjjNn3xA572UvEjBfmNsorpJpt98TDFogtgnoiLXCvA=
X-Gm-Gg: AZFdTZe1xxLeSuvO8Tum+BwnWhpz+zW6M0spAm0Y88EtdlaJls9FnxZH9lLy2ufxtAs
	cMRo3i5Hr8mUxSBEEyWc/wfACCEdoo1vIgLnca4wglgRpeY0w8lWtw1SrjXPgX2TIBqs2V5AutF
	iJutrAG5ExuiFic9guMReIIOBYua+9gpVd/MU0iP2WY2tBX46GsR+qlGFjE+EgxthVOwVSeulI1
	/l+g+Gz6aXZ5ggP+i+fLCyKooPvl8gobUjNIVZcjKOWnB7Qsj2zIMi4zaP32uFi8Wty1Iw05EGP
	x6HQQsSoVxP+ktXiCldNdJy/wzGDYG8mNqqlT8apjyvrwhHHU0ymwacgjuPs34KYAgfctxzbgjI
	TrSh1RddiABTqt16N1I+JIW/sPqYyjgob9s2wd6bgTS1peK17WkQA/wdeF+xZnFZ3PqKyD4z5l9
	3of1MmL4PMjUwv2hpw8ImcpECyQ8dzRTDB7XBxU334mc/LwTz8KWM6bfrOaMDw3h/otGXertUVq
	M/9HqfAZweG7dhPqSomRUS5BSOG8OXY87Vwm506l9WqBj1qVMfChsmIAW6zVQV2mTM0eMqmWrRj
	D9ib30aRPixQd/MMfqE433F4ZQkVi3hFG6mrE7CY8JuCbYikq0mmeZjL0Ak4RuwG6ma3XDzD+Hm
	8tOlMJ/HOqmNKuCc6idpUBaJVLnaUyamkIGvBbBvXZZZDH1eyt4DSVg/eNZBY4U6ppdOg8QEAfY
	sFvphQjJyM+CBQvGYWK2bQMv+9cQ==
X-Received: by 2002:a05:600c:34d0:b0:4bb:6a5a:7839 with SMTP id 5b1f17b1804b1-4bb889428eamr194057365e9.34.1795380699930;
        Sun, 22 Nov 2026 12:51:39 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 0/4] pmdomain: imx: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 21:51:09 +0100
Message-ID: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_125142_055625_A7078144 
X-CRM114-Status: GOOD (  14.82  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The i.MX8M power domain drivers register all their domains as off.
A domain left on by the bootloader, e.g. to show a splash screen, is
then powered up again by its first consumer, which on the i.MX8MN
turns the display off and hangs the system.

This series reads the state of the domains from the hardware, so that
the ones left on are kept on until their consumers have probed.

The first patch fixes an error path of the blk-ctrl probe. The clocks
held by the last patch are released at sync_state, so they stay on
until all the consumers of the blk-ctrl have probed.

Tested on i.MX8MN (BSH SMM S2 PRO).

Changes in v4:
- Register the power notifier before powering up the bus domain

Changes in v3:
- Add Reported-by and Closes tags
- Drop the runtime PM reference synchronously in the probe error path
- Keep the bus domain on while the state of the domains is read
- Remove the domains before releasing their boot-on references

Changes in v2:
- New patch
- Release the resources of the domains left on when the driver is
  removed
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed
- Rebase on the changes of the previous patch

Dario Binacchi (4):
  pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
  pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
  pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state

 drivers/pmdomain/imx/gpcv2.c          |  77 ++++++++++++-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 156 ++++++++++++++++++++++++--
 2 files changed, 223 insertions(+), 10 deletions(-)

---
base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
branch: imx-pmdomain-boot-on-v4

-- 
2.43.0


