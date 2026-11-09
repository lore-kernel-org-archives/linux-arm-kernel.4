Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB460A3819
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 23:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3z7PVzwl;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=F6VpjWcT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+skd4ReZXdp3+ybDH7k1AcOUqtthV7E8Fkq0B8eZiX8=; b=3z7PVzwlNuHFt+
	IOr20u5P0T4GdzV8YoCLb3n81PpH57qRYH6f/Mt1vSqYnd5W/kBD1MZnSiJVHAwSIgkZWjdYn43TA
	D2J87Eakuf44LdYubj+thMi1Pn93Jr+FVoWjv5XIsVlLGf33SdOVjOQVCKR9RysZWvvJ4AwuZ0OaI
	P9jAcvOhMh/NDccuRC6Sj042Vk75EG7xvVU1yIuO+fXJBh2AREPKTzHP2H44pf/KvBtm3egZiLfTx
	fOWNyuXkNy5UWZ4wuSkvOFSDN+mIZPz3g5GK1qbAkWYGENJ9PookVeod75zB5B+6GwAMtd3Leg37B
	gXZF17Eyu7sgQMHWGnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZ6C-00000001xkL-49B5;
	Mon, 09 Nov 2026 23:48:28 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZ67-00000001xiR-1pKS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 23:48:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e96502e447so12031745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 15:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268102; x=1794872902; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+skd4ReZXdp3+ybDH7k1AcOUqtthV7E8Fkq0B8eZiX8=;
        b=F6VpjWcTRNMhM+XWTdUXZBYt2g8/rdC/yqz0g94sNhWZaEbZnCqdR98fwm2ASLQloH
         4ECG/jFmOwQoLRf+xUJ1rmBVta8PfSEaF17PxH87cq79N5Rc/kN+cYLBVV/oqOykTina
         nO5OkGgX26f70peH5dQWq6AEtXldURdzAYa2FYP22yjb4/INP4WKBCekUFsm4dlVkf4e
         Hy/uRmoXkEvTQPPh9cEImsMcNpizwA2z+3hGtdRiYpjmVBw5sOxHJmNehmPHojKzwcca
         fg6Ega+X7VhJfEHiEvIzkzCWjBXB14TT0yp8jlx0M2VL/OLgM5zTzBpk2CKdh+gfoSO2
         HbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268102; x=1794872902;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+skd4ReZXdp3+ybDH7k1AcOUqtthV7E8Fkq0B8eZiX8=;
        b=MVm4HXxA0qTiTfHnFDanbR3uB+C7WN0m+OoDcY8L0W8eYaS79Q760p/1juKX3O2oyi
         VSwCk+x78RhimpI6+02HA4hKCyD0tXIfswpLyZavxJuuWagQS3nWSAdaoitHS+VYHKTO
         GSUR0E88bJd9nn8SOzH6MwLDga2RIyyI/F+r2B77Wys3xBGr9OjqLHBAtv4+DvJMIzbW
         5KnytvSLok1gN2IhOOan/PpSY9Tz4PKRGLQTKxWN2vQuOZC8xwwS2Oq3uPon4j2D/OgG
         12ODy28hS1f8+9xhZdVsYWWm7EqAs0XnPSuT6koQC2wrZYWCmSupkyoDcsLpBlmSeIe8
         +LhA==
X-Forwarded-Encrypted: i=1; AL+hErEUEVn0FhB+RoiCcT5t62NUp9yZgUaypCasg74FUUzz+2j5/kWLAXIDbx+KxDyog3WoBYQB614FnG01C3ihaoM+@lists.infradead.org
X-Gm-Message-State: APuU4Z+BO4hBKiW2yoIeI0zA4uppcNinZ54RPYJMv6OVXNTxHI0WoXlz
	jk6KBjdF5v07Vhy2RdYQOd500Lap4d8f7h6iXAWNCru2l43GbYj0hqaIo8ZaWZ0Biog=
X-Gm-Gg: AYBFou2w0hkVZL+oVeS+L2XoupYZFllHEqcIuFoT9Wlzuc2s5alL495GwztkipG8+c6
	ooCTP1rvXJBpiGfrbhriImZZhdgFdWfbxgyo8BbtHEuq8SJtDOjWzkQc8FlYqcJ/HBd4JL9ZZAX
	blr/7pIA36qkqAH+WdotnDo14URSU4lXny7rWaZJh8t9CpCsH4TZ4tP0FWPnWEGSmWSvM0PNvvU
	ofcjpG9VqMqEtzIv+ifPbq1RSz8WD9Z84LUf75LBze+vzgK0mdP4/O3tiN2hLPyYjmUwuGo4aQV
	KLUyMcNUgxXIwlrIpYzLaUw+61GkmaUsQCAmKZsPuGJF1ScsTCfz4KNKu+x+FaoYQBRqrk+8wdW
	O4U4EM64kXErRIObI+1qCfkiu0iJPoOkhOol554cpyXp0fMYQVct5iZXZhoeEGb6QKyBD6NVvsT
	1fKbyytwGfEMa4oYApLb9rUUUdG7vnw7lQGW2hCJ7USL32lg+puoJpSK7WWnMSoGO5GorAP5BeS
	M8i/RyGizy8C9mIJ63nYnrhgn9ZA7urZ2sXZoHRlNpKpKq28sPiAKOlI2DQNuIrlcfIwiPXv62v
	TZsQpEd9BIbHkZdUzRpKW9Zx
X-Received: by 2002:a17:903:3c6d:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2edb9246e43mr6572065ad.27.1794268102310;
        Mon, 09 Nov 2026 15:48:22 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2edb6e108bfsm2626145ad.76.2026.11.09.15.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030-patch-ektor5-dm81xx-vd-v1-1-8ba90608c25b@linaro.org>
References: <20261030-patch-ektor5-dm81xx-vd-v1-1-8ba90608c25b@linaro.org>
Subject: Re: [PATCH] ARM: OMAP2+: ti81xx: use non-scalable voltage domains
Message-Id: <179426810111.2265990.13077488859947627237.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:21 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_154823_479049_FF41FB37 
X-CRM114-Status: UNSURE (   9.55  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 30 Oct 2026 11:40:30 +0100, Ettore Chimenti wrote:
> TI81xx SoCs reuse omap3xxx_voltagedomains_init(), which registers the
> OMAP34xx/36xx voltage domains for every SoC except AM35xx. Those
> domains are marked scalable and reference OMAP3 Voltage Controller and
> Voltage Processor instances, which do not exist on DM814x/DM816x, and
> no PMIC data is registered for these SoCs either.
> 
> As a result, omap_voltage_late_init() tries to set them up on every
> boot and bails out early with:
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: ti81xx: use non-scalable voltage domains
      commit: ed20363e55aa1ea0dcf865f6776354f1628f5375

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


