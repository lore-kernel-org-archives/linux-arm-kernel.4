Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C99606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MlnPzBua;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ODWD7QnN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kg/ysFr6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A/VDrnF8rEM8ik2qBI8UieOOtJ2qpXz9Tme8jmSivy4=; b=MlnPzBua7O2LLK
	ygRt79WVCoidvMhMEaECi9Aeel/+CHbLnGZ814AY4LedLxDQH1K5RJYA4FdatOFdJzz9pU/VGkCEI
	tZ1ZIdDzMi0xo6MNkR9bp0PLDdEuSbd6t+Ty2PtuPd/ACSsarYPlgBg0l7J1XwwTHSra6Cu92G5Fp
	ofaYthObAVKQMsqYtFhNRhTxUVd/9QIaCH7gvu/52aMVr1pZ+OU+vokr1dbCMPDlgX71VKPPA5QfM
	nfzFybmARn2vObeyi8N36vLPYyHuBc10a68u333gTlaAemVO002HlmYEgOoGvMgh2ParUGnsO/kaF
	3yKE+6p8XKB+xwVaqACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc7C-00000008P92-1QqH;
	Wed, 18 Nov 2026 09:38:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc7A-00000008P8X-2eXe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 09:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=A/VDrnF8rEM8ik2qBI8UieOOtJ2qpXz9Tme8jmSivy4=; b=ODWD7QnN5Ho1G205XwEqs5Hd/0
	GYEyX4iAiviiFqhHf+1E1lPTfn7RVGApjIMimizOq5sL9YvYjz8NcHhlVE1AY1uzU2Uio/Ph01zDa
	rOv+AbEuMvYgYsYLaEyAVYiPAiPWto88x8B5CzxogAd82Bu2PHY+eRk7QQwRdd8veNmmiXSb3ao5D
	xQMmUb+BN9tKnHE5pMMoHaqCFWLyJptHDQSgXigoOCdsLGBTuwqutdVM0pAOlnFgX9ukZFw6ykgnm
	NRDnJA5JmWpVO380BRnvh3p0CpTw26j1bLdccpn1sHQc2gg3G6pX9vGqHvHNtTZKcBq7y5oRpByrG
	G9WuvOwA==;
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTc71-0000000Fs8i-2vft
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:37:59 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1157884eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994671; x=1795599471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/VDrnF8rEM8ik2qBI8UieOOtJ2qpXz9Tme8jmSivy4=;
        b=Kg/ysFr6733HqyIU2YIR6r1cgI++bk7VNpBqfkdtKRoDuqQQ7EQ3jwH73JEt3APsyS
         bI64VhlV65ZBsqmmfqEiXKGDLqJAhMFTuPGZbsEq8zDrOhjjEaMVWakJEQ3JJgxG4XmQ
         0/H/0tJXsmAR609X/XDP27GL6yAwBCF2gYMzUnnnBJlmToExfyPn36axMqSQaxW1jRZ7
         ZU6sSIfACD62cuQHoEHssI3kGqBVWF9TAMFOLrFCuEkE2n+sd4WFxBnv9THRUHkaJPMQ
         Ng+lzZqSTHTgNgwTRLc/qUBEUBW5WQK3q6sj/rES97tPX8Ici++2NJGsYRUasAdoP9L9
         xK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994671; x=1795599471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/VDrnF8rEM8ik2qBI8UieOOtJ2qpXz9Tme8jmSivy4=;
        b=GUN8QxRRhxIsFYW4aUKwLfH3cZ52dfZTCt03P75Fodv0a8qoyZ/4CHL+70EDEvsjP5
         xKqYejSvjX0fHGIqWmYbvRxI1jF2yDKPd+hObTiEL0TqYTbY2PaYPovKZIK7Q2qiPnbV
         AIx3KDNDqc2orp1BfEbCjzXKVqOg7wH/XuGbq+LdhlIy8xqj1fPkxadgc/LMqsDIbDlC
         EU9Uirq6qlMSWYm8sYgYGgksFpTR4kF2LuxWDLHzHN8eaJ7nNIpARW4RdoAbrlDr1g/K
         dyShEGvj9t0S2le16EKpvkJh/UYf2N/eU20SM7ibj8teH0/giionmDsSSP/dpgvqCuAX
         G8Ww==
X-Forwarded-Encrypted: i=1; AL+hErHmsQ22+R6soH+Q/mi5oriESIqsoms5XiSIX4Tlygd0C4vSYldnAgEh1HEEAgjynDrFF2Rwlm+jyDsjJZFCK0Dk@lists.infradead.org
X-Gm-Message-State: APuU4Z/0LfuPMzAd2Kf4Czk2uF7EB0PAOV29V67KGu9/UFHxPYy78V19
	QPhYQex6jPz61B8Z4JNM81PKUHgRZVFZ4G3yVRDKcIPvEvo9W9Bz89zS
X-Gm-Gg: AZFdTZdgvRunJzEX4CcNSxL/ET3aJRXYDvqFdIoNb3RvqJ1GygjYDAXotGMW3TXIZCd
	IV8GGuPhai9dmecRyMdKPNO49+96FObPqsrb084ajw/CczXe1A3dBa9lV3XaBrVD5GZNpwnXWdy
	eETKOZT8CMikl5ofT9bOzhtHruHFpo7SX8N5WnhXKRtNR8WeQrKzfV1B1yCxWBkSFw2XSYy7Qpu
	nwR632n//YU950bRD8aTWN1MZmk7DVRbyIOhJrDCz7NBFeDwNwnGvAh/+qOnlnZtq771ynkyrts
	47pU+PuE3+V9vZp1gnl+ACDfBhYo06y/KgxRH/ZLAGXpTLAlooan1OGvXwkZtk5nw0hkf9Q0z2V
	1iyONwUE/0HTk5jOih7KjrmMwKyQfT3HgJJSLhNRy99n8yS0RILcN7S1xtCRKoUOFlBxqGKt/R6
	DcQTAKcUf2gXMB2MLPsAHGYlx9gjJPW4UNRRwqcinOM1UIvdjig5aduqPUUSdXRIQuol9WDrE5g
	yqlAuXx45mXVqkzKLnTAMp5ZE0cWHlpMNEyDtO2qi9zk0vkSp/twtuK8qDuokpf3eQ+4OWkahTn
	O1+IwRIUqvitkASYXoSdWoc4K4szBLcw+qk3
X-Received: by 2002:a05:7300:6a90:b0:36c:dbac:705d with SMTP id 5a478bee46e88-382815247a2mr1735354eec.15.1794994671297;
        Wed, 18 Nov 2026 01:37:51 -0800 (PST)
Received: from Zoro.lan ([2409:4090:2022:b216:787d:f4f4:944d:f4ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a76d70fasm6353460eec.22.2026.11.18.01.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:37:50 -0800 (PST)
From: Vishal Satle <vishalsatleit24@gmail.com>
To: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vishal Satle <vishalsatleit24@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] PCI: mobiveil: Drop unnecessary msi-parent check in ls_g4_pcie_probe()
Date: Wed, 18 Nov 2026 15:07:31 +0530
Message-ID: <20261118093731.43980-1-vishalsatleit24@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027094427.143733-1-vishalsatleit24@gmail.com>
References: <20261027094427.143733-1-vishalsatleit24@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_093757_349795_C3DFE0FE 
X-CRM114-Status: GOOD (  12.96  )
X-Spam-Score: 0.1 (/)
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

ls_g4_pcie_probe() calls of_parse_phandle(np, "msi-parent", 0) solely as
a boolean existence check without releasing the returned device_node via
of_node_put(), leaking a reference count on probe.

Instead of keeping the check with of_node_put(), drop the check
altogether. The driver does not use the phandle directly (the irqchip
layer handles it), other PCI controller drivers do not enforce this
check, and without "msi-parent" INTx still works even though MSIs will
not, so probing does not need to fail.

Also remove the now-unused local variable np.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>
---
Changes in v2:
- Drop the msi-parent check and the now-unused np variable altogether
  instead of adding of_node_put(), as suggested by Manivannan.
- Link to v1: https://lore.kernel.org/all/20261027094427.143733-1-vishalsatleit24@gmail.com/

 drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
index 4919b27ea..f31be6327 100644
--- a/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
+++ b/drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
@@ -198,14 +198,8 @@ static int __init ls_g4_pcie_probe(struct platform_device *pdev)
 	struct pci_host_bridge *bridge;
 	struct mobiveil_pcie *mv_pci;
 	struct ls_g4_pcie *pcie;
-	struct device_node *np = dev->of_node;
 	int ret;
 
-	if (!of_parse_phandle(np, "msi-parent", 0)) {
-		dev_err(dev, "Failed to find msi-parent\n");
-		return -EINVAL;
-	}
-
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
 		return -ENOMEM;
-- 
2.53.0


