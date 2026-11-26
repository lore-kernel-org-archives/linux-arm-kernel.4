Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED75B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kCMKbQk+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWDMW5oP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZacRs5JbXlxo/OQerWiYpTqRNCbFu2nOrkARU1a5+kk=; b=kCMKbQk+XcjsH/
	oLz+K0HTqOuIxWw1NB0dTCElyV+9Ma1nErRqmrIvK6Wph6xnK9NTO4Cue/FnPviDZ37ptyOWLBR7k
	4tz7+FsD8GnV94VVjMKq54smCvQCtjzcJ43d+NExKyu/XJ0GrC1N6HJN3d3qmDo9pLRKpzPYZUtX3
	3ZVo4P4wotXq5z53DPz5c8Yd0+EzQgtGUSGbgWl4v9EyHwYF46USLKVMPWDx6NdKEXdhbujkrVvRU
	QWF6+40ccjsTdlS/iXHNeKmCyc4MX/z/BhSn2auSQ74jcSDgdu5zPcutPwe67bAIHpAETkbHmBFGC
	C9EDDnqy7nOCiwtOAfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeET-0000000EB75-3rNk;
	Thu, 26 Nov 2026 18:30:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeEE-0000000EB2A-1j5y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:29:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-497614c95f0so4202463f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 10:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717792; x=1796322592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZacRs5JbXlxo/OQerWiYpTqRNCbFu2nOrkARU1a5+kk=;
        b=iWDMW5oPV0KYWZuItosj3YgtYSgzBF54DGtg1josFBO4WlnbefMCxd3vXX6jcx4tEs
         T8olXW4y3Z/IzlHh6mYRtSxPb5dW+YqZwDAPti8UHA7x2qb09vdLJMk5OGpZSmqd7NAA
         NC0r80FUGe7SwuMdo8POjkjn8ETjwPoNVNXHLej68pce3rdVjIRC67ghO1F3ba5eD5Xo
         FAlYQBtAvZxhWTMyVbes5yFLW8Rf3gmmCDlbj3jWPyQj9/I68v4CE4cuNF4sYHzxSHsz
         oJKSV5+V0KWiLVNaCbQgGiIjTaZoTuxTJJqJpaTr3fRA77XylSGBsfnSEmuTe9HK7siZ
         oxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717792; x=1796322592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZacRs5JbXlxo/OQerWiYpTqRNCbFu2nOrkARU1a5+kk=;
        b=PfP7it9f7lFR+6SBeRFplbcSD4kij8kXU+yefXEnUPh9a/HgxWk9H2ELN7mEVprxBo
         FcYeJLE14rFxRcIs5NQ/PkVTqmplVzTKjb6bQFoYERdf+tlefQcfshOhqjk+U34jBtbS
         XgC2eWkLyAJU9/9Fow3EYSAa81q+b3iwD1HRck64zvbPrngIRO8JVxXfyoHeCJr1OtM9
         RGJS5GK1aLVSP0pEeNpvckoqEluTHvcr6BRr74EoWAMzR07TIqzDy8aDVy3IhVbNiIRC
         +Adcsm1GsLaDHE/QxIeNDsnEVJQ1reRPkskK6SmUe5ned8RNTiilTjOm3LkNdxAlsrmX
         1sEA==
X-Forwarded-Encrypted: i=1; AL+hErELN5AWmRkbEFQ/o0gr3KbZOx0laGpZtMvcH4b5JiEzVlsbj/0TyBUBcYkQ5p+/v7u3EA3HF/iFOFcNRKzdTyL2@lists.infradead.org
X-Gm-Message-State: APuU4Z+Sl/+2UYbBEm4LUtwvDIoGbshUu/YK+Vqt179BY3ajTA6DTr4V
	XGW8QfaLxrwBWHdjiOvrfjpY5RxKTu3TqmkRRK26QeGq93EV0N2wLevv
X-Gm-Gg: AZFdTZfeHEH9cgCbCln0TMnxEF0s3JHWCsWVACqS0GXSMXNSHgcAgFBq0gQV9ICy3Po
	2yQsNFsJmCZRf0Qbma3vs+ta0zJAl4MmQgkhP2i51rKI+HK61uEai7SvEJbmRzlrih49kejsUM0
	OdHioKAFXVwBGO79xLZ14fGyYVR8iVV3HFiFbPcloPXXveCUHtMB1IbhOJkwjzPmfDeGNcWQFcw
	vg+EyYyrK4p3pU67O65VEQO+WR+9m2NxyZFtkvcBYt6yIyZk1C82wRIBQKgZ9jhv7/gVJbuhD4k
	/oGQNgWMGri9kIv3eo48Yhl02A7/rObC8r94QNQ6jdbNA0IFOnLGHXxFpEvmJF3f8VoAmLhp49i
	oxsGCp67BH+5PalL/INaur3UNfaES1TLsxJbtEPynXZVPkf7/u0+kxD/39ECQ/DCNY7XYYKXWlY
	4ynnc5zO2yE2cJBlfSnBVZx75zznMCUxScGZh58Zn8i9p9ieDJSi2dZZ5rOsHX1XP+wlLKVQmY3
	FULy9m8Te7pxNU7wtghEw3+fcQ4Bg6XbnsJkjMRat0PFe53riWjkQ3vOOO5R5b4b5P3botbloXD
	1asoS5Q/2GuXAhq+gEZZoPVJa2HfKRs/PBXq9cQWBOuAjyUzFIBwPBIjLqdZgopY/M5VNpWXX8+
	M/3x/kbVr7WhIxDchF83FHJ4dyLIn7R1mPufC8mKL0YPUXehtiaL3DvQ0QfC7BzobIXLfFovP1M
	g8ABxAjHCyrB6pKaieCTBKTnFIcUFt0f4i0eIa+kku3l4B4xgxx7RXD1bLXrcEGNIbyZynZIqbl
	haTM3qKLqWzdybYfpdxhewDLjlMc0+beaFSaUQilw==
X-Received: by 2002:a05:6000:4284:b0:4a8:647c:f964 with SMTP id ffacd0b85a97d-4abb6d04d79mr46331265f8f.57.1795717792277;
        Thu, 26 Nov 2026 10:29:52 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] mmc: sunxi: Distinguish CRC and timeout errors
Date: Thu, 26 Nov 2026 19:29:44 +0100
Message-ID: <20261126182944.3136900-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_102954_482498_362D1658 
X-CRM114-Status: GOOD (  17.12  )
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

The driver reports every command and data error as -ETIMEDOUT. The MMC
core however relies on -EILSEQ to recognize CRC errors, which mean
that the sampling point drifted, and flags the host for retuning when
it sees one. With every error reported as a timeout, retuning is never
triggered.

Report response and data CRC, start bit and end bit errors as -EILSEQ
and keep reporting timeouts as -ETIMEDOUT, attributed to the command or
data phase that actually failed. Report any other error as -EIO.

Currently supported SoCs don't implement tuning, so this doesn't change
much for them, but it is needed for the upcoming A523 delay-chain
tuning support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index b862df26e192..c2e84c22d3fa 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -537,13 +537,29 @@ static irqreturn_t sunxi_mmc_finalize_request(struct sunxi_mmc_host *host)
 
 	if (host->int_sum & SDXC_INTERRUPT_ERROR_BIT) {
 		sunxi_mmc_dump_errinfo(host);
-		mrq->cmd->error = -ETIMEDOUT;
+
+		if (host->int_sum &
+		    (SDXC_RESP_ERROR | SDXC_RESP_CRC_ERROR))
+			mrq->cmd->error = -EILSEQ;
+		else if (host->int_sum & SDXC_RESP_TIMEOUT)
+			mrq->cmd->error = -ETIMEDOUT;
 
 		if (data) {
-			data->error = -ETIMEDOUT;
+			if (host->int_sum &
+			    (SDXC_DATA_CRC_ERROR | SDXC_START_BIT_ERROR |
+			     SDXC_END_BIT_ERROR))
+				data->error = -EILSEQ;
+			else if (host->int_sum &
+				 (SDXC_DATA_TIMEOUT | SDXC_FIFO_RUN_ERROR |
+				  SDXC_HARD_WARE_LOCKED))
+				data->error = -ETIMEDOUT;
+
 			host->manual_stop_mrq = mrq;
 		}
 
+		if (!mrq->cmd->error && (!data || !data->error))
+			mrq->cmd->error = -EIO;
+
 		if (mrq->stop)
 			mrq->stop->error = -ETIMEDOUT;
 	} else {
-- 
2.43.0


