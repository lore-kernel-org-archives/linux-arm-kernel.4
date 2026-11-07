Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C4606A336
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 18:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LTU1U41l;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTyGAAJ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=; b=LTU1U41le/9pBi
	u0Wj/nyNDMyuQ15RBDNi6HC8b2SBDCCTuP0wqKvU0v5oAO7mYhtVFi6vmsQw+9YSC7f8aNIfy/bTP
	tJSzVU6QaDcjlWHPjzJW1PEtrr5JbDGK6FhPjbXaeBGClSyTzcCcS9pv//kChQF6qzujvYwXl+nNb
	g/lEvUPtnFBEMfYDjPbVz0MmrZMFHO5Fcitl6PvUxKeWhpbQLUSHLK7i6YOjWGJiUb0a39R3KAD3S
	+SmQQ0pp45CQIg59U+PI3ceVochc43XO8sLZrYqasp1RSYg+euQYwsyPeAuySP+AzSXJptzXITJhd
	DHFHpCMOIv1if9UA6JFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3f-0000000F9zh-3k87;
	Sat, 07 Nov 2026 18:22:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3T-0000000F9pQ-27zA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 18:22:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so14542355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075737; x=1794680537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
        b=ZTyGAAJ795CVo65dWALy/wwJtK3DKZ17Fsmd7nfH7/8WmCGnUe27Rsy75d+1eY6DXG
         dXpQgofnYuOlsGthy2E5pezRScakGhuuMFc73MWnDDQF2FdD4qWeoTXEkq7OGnldxbpn
         eXibtvVy2TnHFSP/83bTmI05EmVW8woiljb14/2AQPB738Hl63+NgW7rGazjjIvza7nR
         lwZxLNP0O4FJFI4Z8+UP8l6HNdtjl5LyPJf8U+9Gl3mk1dSBgnVNusmg0GitJhFUOB39
         29TbPs7mcU6amCMP6dy7I6xWdwcS9s1Ak3IfdhOgIlaWGEM7rfQ2wbrDE4OHOXH+G2GF
         VlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075737; x=1794680537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
        b=b5v2ZHeCUGBiO6q4Nvy8IW8x+1WFm9XHiLTIw/LL/ijRMVeOnPIcH/W3ny0WjaQnAR
         Rrjrx3eJZjATN2oap4NiS2BtEmAXfO/AJcITfh74q/MNXsf+YeJbgkwnCUFQtGKV88lT
         FYHtjUfA1cMlr4U/bCXM++ScgScITmsW/P2riHytmO+BXMPmlNAt/DCT1Tun75ORoeg+
         BEefavHceRneWBFecsOuuaVpFt0X6yWQKi7v2TQzvjYyyYBN8VA7H6ZwYbvgQT7vdJ7e
         cZWkiz6ZSoRfVLDu+Juq7akCbo4v0146/Ua0/COs+9FeZScrExpjn3Q0Yu9Mvs557Lcx
         eQlA==
X-Forwarded-Encrypted: i=1; AKwUvByQ1XuE63Hky0wNw5paFRr0nVc1N75diGadWO1HL79+VG01+/WHvJXOK5YwEuUexi84Fe5EEOQELKvqDOhLhes3@lists.infradead.org
X-Gm-Message-State: APuU4Z+tH1FuHuUvgNwytu/oXvc0OvhZlYDRWOIs8FZm26QXXGVTohXp
	khfghd1g0ZzZOrZa1Ef6ihur++N4A4xO+mGg1dfsriDZSE7KwXmCbPA1Dsbk6Ve7GKA=
X-Gm-Gg: AYBFou2hCfqF364fKfMYUZBg+GmQc07RE5ohMEF+d1lvH0gEr6+sKsXsQry88UFrGMM
	BE/FciKytqd6tvbj7XiogBaz1586Mo/gJ8Tek/Ka+t0iieqnmeuvvIB3eNZRWsHlEZEjbPa8oYt
	RWIekK9BjtOR65B1uzZ6yHFFXMIUSpUNxOF7YKlXb37lr4ZtLiZz5zTKGHAfsDi9/lGWokFTUGw
	SOa89KVSAfUUHM6uJr3Q0phiasVAaU5R2KgGT4hEaHOSVwbgAe0QzYhPjTwZxmXXid1eCrtPXp8
	/hDQrgtHjmzgBqG7bJNc7/qfsU5JaGP3cL9IGohLSI6P6df23+PTCj5cDtvUFRNLalKlNzCQ0Wk
	I0b+84ZhopcnIppciHAFodcFr8GbnAgc7cxteOeBCEDg2JK8pSEkPeNAI+IDNlvjQKJVxf/J2DS
	JAZq1mmosFufqGf16eLV0MWgnse82u+JkjWesNlUsTQjnSaxVaO14C+vxPwmbmL0PRJqEOvap7f
	SIgzadrlT514Jp81AgIUSrUcm+grem8G4Bm1ikXXupjfc9b95qZHEkxkYT1r5Mu/m6xBTuwrVFB
	dIRMWyZp9SkYjFx1mvwDO1bKsC6dtZr7mht1msC74/qHfNwXCHYg/9nFqHNXT5V8do3fmNjEsYQ
	qPqGPGyhhZaH1808=
X-Received: by 2002:a05:600c:c166:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b6de1c6820mr102380285e9.21.1794075737248;
        Sat, 07 Nov 2026 10:22:17 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:16 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:34 +0100
Subject: [PATCH v2 4/6] firmware: raspberrypi: Remove unnecessary braces in
 transaction helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v2-4-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=R8pNK8uv7/mdLr9QZyRKpk7qvj0fnfV1DdkNj860TPY=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVvy1kMsW3iud0rs8Tle7zpWX29u4KhUV91
 AKwCIIlrpyJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z7X0D/9VAqyxpg0/A0Pisn5PP89dvOX1GEAoFiqqyb+TJUHMa7CKi31bKq9olA1MpdWkUGcI21Q
 blhVoCgBYACvMYCbM3u1g4U/qRR9ZSaSRNx/TH3LHiCYOBKipc5YDJ3yLMSAidzs06w4ofj9eg+
 jmXCVOqWoQyceoVjxr3QA4+5niHrSjyAummOoFCPTnGP7+SY6Lh/FJqZeoecbJmR7BJGHjyzNFB
 dr9DlMRWEhIdqy13LUrn2Ywt/s+VFqp5YTdmMEpfez24j/DFhDtr1rvhyFkeyFIUsEsDP6PAX7j
 kG5QDsJzdhhp6Y1vqdsZMsgnnSjDZmBXHGL/uow6w32GphpgpTjnuyElj+8XZphk9L74Wuv4WJB
 LVbLhrew/UC26B6bkCB93UsIfOExJWmI1GAXRc4Jn6syGldSp2utjVHE/2hhmWJt6hrPX4jd36g
 Sg+S7ZZOAvN6YwBIGgpQaWe0FXCL8LWP0vaXlu2R+phifhmLoizX+xz6pmGLbrt7Zh2bjgnYUL6
 gjRHVI/LTkn+sawkcLauGKTpVK5N1iBlaqakZIVdGE+NVPz5oEmmATB6kk8QMPB1F953+A8nXUL
 S/MsFIWD6KQ7NgOOLc5Yk6RSlOQ0T9YeUtGIa5QcoE4VGI1EtLTsV8BBU2GjQ2v7sMUz042Hy3V
 KMy9e/9BYaPNPCQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_102219_567674_3DC4D5C6 
X-CRM114-Status: GOOD (  11.63  )
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

Braces are not needed around the single-statement arms of the
wait_for_completion_timeout() check.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 04163c3f385d..d9a569a6dae7 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -60,11 +60,10 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
 	reinit_completion(&fw->c);
 	ret = mbox_send_message(fw->chan, &message);
 	if (ret >= 0) {
-		if (wait_for_completion_timeout(&fw->c, HZ)) {
+		if (wait_for_completion_timeout(&fw->c, HZ))
 			ret = 0;
-		} else {
+		else
 			ret = -ETIMEDOUT;
-		}
 	} else {
 		dev_err(fw->cl.dev, "mbox_send_message returned %d\n", ret);
 	}

-- 
2.56.0


