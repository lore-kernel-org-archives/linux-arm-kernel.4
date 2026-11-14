Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9237C606A88B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b3h3YXXh;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P9Enazzf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4b6Up4gAM70Cuwx/Xvys8/hZil2sANohA08sIDRsk88=; b=b3h3YXXhIZROoD
	Ko4lTrTcw3Qh9g51viqEbSasFmmK8vlhOtX0Ei/2zlo9KC01fozZgrWpTsJmdydUiG/+XJ2xtdbh3
	CLg0H8OIxb/aAijmOVdFqSa+twxjH4m3b5q3m9evvOVePvRUlmLhmpeh7x+0HpUnTMSYGUINKhJFP
	almRDuDhmxAvdYZmO3zdHO4jLqphL+Zcu7bwCPpUf5ShvXclbgXqubt4sCi1pbFynr7jeVUjNQIoz
	Ap4R6r3FjgUI5CgbkV1YmCcd2z87QOcPUZ1i/k6ss+POF/7xx94SWxDsoZn27JVdzL113MmFb09om
	qu1rnhTTpAphwqiYD4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Pe-0000000FFbF-3Gji;
	Sat, 14 Nov 2026 03:26:46 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Pa-0000000FFZ3-3lG8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:26:45 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so690100a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626802; x=1795231602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4b6Up4gAM70Cuwx/Xvys8/hZil2sANohA08sIDRsk88=;
        b=qhhKbAwgXrRUe2coPYZMG6aZ+vzssyS/p3svv755vA19o9WiaV4SVWVHpcVqfyD44y
         ykzS3PZffduPXY3A1dUzXrB+LfpojarH+Q9HtemcT14QJnKTAwdaAyuNYc+ZvFC6EdRT
         ZcBLzKu07WnosgVvnUatAJBqnM+z4s5raewEHGk9H0Z3haH451TYNhMldA+BHmm+EqRx
         DJneNx/7Fkf2Nt1P9aHI+gU38EE1HZHHGbrZTROivTidK0cBhcbjFNhKv+D6VRA3yode
         y0Y0qOP0hWkcw+q+CmNizqAq/mN2KHH4ee97F/O33jKESG8tAx6TDPq4W5v7Q5INc8fR
         i8FA==
X-Forwarded-Encrypted: i=1; AL+hErEcO3EFW3j61j4/n+/DCLTeC3wb2bL+No0dIsFhpBfjEwSC+E7aVLBQmB5IcNle/aUFsbTBr6yA5s4pvZ/U+XUB@lists.infradead.org
X-Gm-Message-State: APuU4Z9Z/m28ZkLsVbZcBuX+1HMleoqQk6D/mtrNj80s0pBjeC0h/4Ab
	8hU2OQHcTtvk/UqX2qi444eJyp7KCclYv+ywaCJoRJZ4fQpsvuuiV/BrpWx2vPmfxABe2bhMGdv
	4QlHjZWnNvxpyfuvbKhnDmZrBmkQzBk8c6q306x+He1P67PIc8cKWvYToc2RJFcT+n2rAQpAOe8
	rWTk8/s3cub/1a7vKsbjUmMTr/waQxnkykIFUExu9ibRg9hlTX4BW4ukwn2Ow3hsp9A2dM0N2pn
	SzjPbUF27Wj5529SYoewJgg8pL6cbgd6Lw=
X-Gm-Gg: AYBFou1zFinLrLclKxA0V52afwYtDg4M8vrRETRN6fgquM68HAjaqT2fh84nymgXdXc
	LsJCyg0PJRwfRzLqb5ywYxX8ubgZJFNVsEruOhY8W3SsORgQEYR/m4jYNntoVPV3e+65cmKiTui
	63QEtvuW1moFmkISW52tlE7lGnsX7qjnU/s2cidkGmjaiRiVIJVfmm+bVNg8ZwK1IHOSi5egOBc
	MVF4a2Z33aER/b91um7psgsuJVviqT2keWUbqZiTKh6O3R2UmohhOq0dKChewRiD3xsdqCLbYJz
	wfMKwfvEaAMH1ELgPrCLO4BizqyPd7r8/aPS0CTbnaxclxk2phg10zMBcmWQSfulsoi9TG04izu
	H7qw4nCyeAJ/BJVJvwnbPltITvvtjKI+1k+DuPy4Ln2rOfg5c+XTU6Cz1RzcMPU5cXl9su/RvlT
	9ibB/Fad90M0EETzc7qoth6+JXwmlPyO5PaROs980A
X-Received: by 2002:a17:90a:c88b:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3b1b0a3e44emr4429903a91.24.1794626802136;
        Fri, 13 Nov 2026 19:26:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0af1sm8858596a91.3.2026.11.13.19.26.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f479b9819so1896364eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626799; x=1795231599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4b6Up4gAM70Cuwx/Xvys8/hZil2sANohA08sIDRsk88=;
        b=P9EnazzfJR3zsWCjhcPDC6U/FSfIOxtIrFBfQA9R2UQP4Otnc1TejKHNAHaxSqWouR
         RdlgxMWUl5JvFZFKhd/q0Yl7t1rCf+oCsPnu2GHz9PkupqC5AP4LzX1MgPIEfTveeP4q
         FlJIMYlbgnBUHktor+PDi5aCM22OeFN3DquG0=
X-Forwarded-Encrypted: i=1; AL+hErEcjtglPAR+bZ80XSKIOD+sPfcPGZ+ZeOd+DXayUILHsztTHyDF2rU8KhZwlDpIeolrTrQQCSfByREvl1RsUatm@lists.infradead.org
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr5925395eec.2.1794626798659;
        Fri, 13 Nov 2026 19:26:38 -0800 (PST)
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr5925349eec.2.1794626798003;
        Fri, 13 Nov 2026 19:26:38 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm12182371eec.7.2026.11.13.19.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:37 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v5 10/11] platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
Date: Fri, 13 Nov 2026 19:26:36 -0800
Message-ID: <20261114032636.873947-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-10-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-10-d25e3b687e71@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192643_598020_DB87B542 
X-CRM114-Status: UNSURE (   9.05  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Nov 2026 16:48:08 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Raw camera sensors often send data as packed or unpacked bayer and gray
> formats, which needs to be processed by the ISP.
> 
> Add macros to support bayer and gray format FOURCCs in the MMAL layer.
> 
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

