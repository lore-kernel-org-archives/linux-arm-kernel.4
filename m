Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A7606D818
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 00:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2LzVDky/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uge5oGya
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=; b=2LzVDky/XUqNQX
	+6ZS0UYb86OVmboZR+jmUUfIQkw8Bua1hGYSMrHOYPKdsOyIHEq6fq1DwsB4jUEmAfG8CQflmIzr6
	SAoWbzUAdl65C9NiM5ecBcbVOLq06z6JzXYF4HOVd6KrA2hJxmILcshZUrHqnsTlwCKcd3DSdmUSy
	EsEIJuYY5a7gi2kFBS/SjIT+JszA4zSNpGCeeM6PepwFIrK9lc1pZ8PKU/cJcB4zOF6QYNDDLrCxR
	XdYfBkC3q7C+EP0j/fiSM4NavfCuVi2OCpkuYbELxHQRw0dJPAj6iVpkNmO3zhDkR08hT4eFKIp/G
	3RnZ8AzAPUXekPIQH47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKc-0000000GyHa-30PB;
	Mon, 09 Nov 2026 00:33:54 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDKZ-0000000GyDD-3ePX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 00:33:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so3478705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 16:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184430; x=1794789230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=uge5oGyaehYj9SeuWRl99e06EFhT07t0hsBi/fb5OspgI0ktwmR/Ehpkfq3sgDOWG3
         VeKjye/+5W/jzZjb2Tzmif6eCGlfeaYxO4HEdAk5pSzZPxTcbNkBTvRTAxNAMrXt3qyE
         4nN4PxqG+KEqgLT7/8OrLuFYuQyqUMvuRZ6VXulta98PLmnSJs08tengkk12iM2ijOaH
         ykjpLE4dhSbw0nUJbNkfqQ3EM+WvtCvqeHiX20XoaGLE5+zLjt72izVPAX8enSM1WBlN
         rZor5ohPDuyn/iX5aoyj/gIPRvKaFn70Y6hsU8cxOz1BNrVXq4zBIrvZZmMFkun4lWhR
         qu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184430; x=1794789230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=b3/27NnzRiqlf9Y8VV6bFyAICaPFELXnVVlfQSN61PauFum0MHm8JW2qlFmC9bW4Iw
         Rb0lTrfDWaLC2BO0r55LQi/HsgfLh7GO3G9mNcoW8YK0j52JLl2sQccVxgX6Jdofwp7Y
         Z1aZn6NAX5EPrvGUJWfpm+delSCc9R45UcTWip3PbGZ8ZM/sF0o3wCBLtRolhv7gdsl4
         LWZ2azeIFHKig5xfX3Nbqpi7xwGYe8aSw27JW4B9xvPajmufCm+yvUpTiVdHlI3NLFI8
         Kpw8I0aX93aD9OyU4jmmckGrnwAi+k3dlG3TkCuypTYJ0kCZXFZnTT2cP+PxY+0sQeyk
         scFw==
X-Forwarded-Encrypted: i=1; AL+hErHS27xf6qiv8Z2G00QxNPQB4Gy2a9cwg0pECqcvnvbKhWbKVvJj17h9Z1+WshQRvvv4C2OfBTIkglTHwbq2k6Qm@lists.infradead.org
X-Gm-Message-State: APuU4Z+Va1laVSH9/Bti3Cuv4V9Qjsz1mDGgZlAInv3jvUnie5jJlYUk
	Mwje54GzgRvMruNJ+TujxAJtVLN010NoqmVY99+n0S+YnE9usmrvlga1
X-Gm-Gg: AYBFou3GW8wylvTI9wzjjwslyOQAjoepJDdnOB00vyMpiwvtl/iAbdD+nADL2eEfj1S
	JfTvUliHyNVJ+Et5/Jn/kPLz9E1VxkHpyxC0dAQeiRPz5BCfFnhkz5pGWkQPd8H0XimjA/fUClR
	lVLd59ffnU4djQV5TjT9tnC3EnNcaSChx8zF4rongvWRUZvPIRWZm+1IqS3sDSKbbzCEtZ4l0GO
	gG+fMv//OUb6t8pVVuMz4YEjCpNI5SfA+0KrYnAp0I5Cyt5gq0NtqaNSheJz/JyuGthes3UUE2l
	ATMLVCAiVdAwz++qrfazr1kvn9EvZxmYUTx6iNrSOz63hI0lPOV+F7Vm7e0/Lgcp7cVGkuD3ftl
	qQcvKJgzF9HplqZJWhXkKgyYZP4D6VyiYwSwBxIqdyKK8eHy6icKoc+cEsRgwpCHlxfGzdb/H5m
	XvDmslShsVonBDPVrLvHx25zry4BL66Mxk0Z0pGB5KYBi1+FkFy3imYYz3mr4zkoT3waLBZ8cp8
	gUfjPD4rIxLA8Td+tsx5b+qbgf19XRKhQwAHJsKoPMRzVVv3Kv5k7lDV77Y0BPFqTUtIjfHjkTY
	jidXFJuRhFR3Arr0B0QQhmLHa77snjLNMWG6yx27
X-Received: by 2002:a7b:c34c:0:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4b8205a7b74mr74612065e9.18.1794184430004;
        Sun, 08 Nov 2026 16:33:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:17 +0000
Subject: [PATCH 05/17] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-5-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=uUjeKsqz31kCcfPZSa8Z47M4B7r1CADYAoSad8joeZDRvAbLwLDkhf9ZDymLvxVoerAVE+UqI
 g/farVtv7C7AYkuFx6U6v9lz+2+4yx0RS/OmA8jjU0ljraJ4I1qJLhy
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_163351_960660_270EB854 
X-CRM114-Status: GOOD (  10.30  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0


