Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA1B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DK7moh+F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/YTtrj7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mahm02DJyuRv3Ysr2SDFTlFeGc04ROwevypZNTuvRVk=; b=DK7moh+F+ubs6f
	HLEJOGqNDx8Tr/9h7HU1/rrwxZaKPVGmUE6LbNJqPxZQc/Wu+Vw1xPNCkRaAsSxVetGCU8IIBYiEn
	zaGydL2cBrgO7YWa7zTYKtIB/SfQlwgOQVshgWzMMUxdS0pApCDdUXqIm/O7I3kKujhVM7hTKG5zb
	q3iEBew76SUpyxnltBImG3U5Ra5miYpFhYckGVk0Y0oSIESfcFCK2xtS1ZfrDwXjj1N986V3XepgS
	Tou67ZWSxS+QlTXlbracza8gbbrD82D80kpOeJYccBOpgtAw6N1F6m62wLBs8gb8qA1RQFuJ8NEp7
	YWsHQhcotZBX0UIsi3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp10-00000004anZ-1WgQ;
	Tue, 10 Nov 2026 16:48:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp0u-00000004aiZ-3PwA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:48:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27135945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329283; x=1794934083; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mahm02DJyuRv3Ysr2SDFTlFeGc04ROwevypZNTuvRVk=;
        b=k/YTtrj7K2uzcUnUPqtKjR9v8qNTIfPFfFinfRz9Ozq2Pun31imly8niqgfrlsaFmk
         9o2xqMo4ac4qk45Nc+8iZHcJ+rHsNIUDvpXB+4JTNPdzFvlRdvi+LND8Mdzxc1bykIuc
         LbyFI3NAX5oIAodK0GfoDjAphoCDNC/MqRDswkyCxOjq4sV+qBC6z/zjjCIHoLmWos/W
         2A67etK71PavmlTf5bytTYnmZSywTcSxDttB+xuXNBqWz82CNaVJ8PA11yRQjplIIMZ4
         lXcVTCR8vTPJaAujgNQva4wFVIGENp50hMHoN9DTzRUcW1G7zeYpoNTLsfT1TyJEg5tq
         Z79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329283; x=1794934083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mahm02DJyuRv3Ysr2SDFTlFeGc04ROwevypZNTuvRVk=;
        b=nL9LUaciksaJ0/Et0OAaNNZ68y35bgi1w6dKseXsKEm0CXo5Vn7LU7g2EBtXBITCNB
         KKOiMy8GuYCsHomw/xHS7qOxLXVLTHfVW129pR8R3Ma4R82WMBhGjKbyqb/MucVO8wqN
         WyaQhUe1xCQMVSCk90RCKv1rtiDlrMOlopzjME1b7hJKKGh3J+m51suONYZV15VX/e6k
         cS9zgr6bZOTg1ClmfIzrLsiZp9AkSelWVVU8eq7zM6bVmJCPMnCuzFD7/jU0byJ7b+g0
         P+CBqQMCxWT6aQ9zlD4Zpz+dj+7dBndD3yi6RwsyFt8UWEMRSJpZtqL+csg2+7zTMv5R
         mDwg==
X-Forwarded-Encrypted: i=1; AL+hErErQxocR3FAAyd8rB6DbeBul3tf4AfjIgaxQfI3n5Axq71dOfWAMTUO4fFoXZ83ubUtBwCNNKONo9KuqVByoovT@lists.infradead.org
X-Gm-Message-State: APuU4Z9wYAQIsNfbLcmDdZF0VieD/JSdqQyDSs7qCXt2slVda28r0nbh
	pciqY32Y8zmCY1nd6t4dol5bSyg8mvyE0+TZKTTJBUdHeodv41uQZi6D
X-Gm-Gg: AYBFou14j+IRiuOlI4BsFlg+N3huNHorIemf5bHc17cIrv7lz6lQB0dJMlUxF1sJJtb
	ecMn9Km34xxrSc80PpwtFjN8Subg0TPvVhfwP+FS46SFtNyZcvRGwuwrZGYa0TrOZ00ziBzQzzT
	HHoDUw68d8XVl0SrS3/vksiDgzopm15DH5WJNDuAVqVyf/gdVCSTqSxMOFWEi23JwzBl9JgR827
	2SLh/2z2w1iheCppznIqRBgxLI2iInCwXK9b/mp5HtHQ6+MEE5T22SK/9JsWOuWzqQINWyPsd/l
	1dprwP3bSvKXhoR9V6ghuoPqRxOmtA7NCK2vFntD6X2c67imVGxg14J+0frI/cQM9zFqRTitu52
	pqw1hWahFACGJnyxC+1JC3JHT5/ghawU4SMi97DgcdD54mh3otVYYLKCJTZj+gXQm6t7L2ePWQh
	zIuzh7/YohOOrFTf5lZNgHSRFH3TtA5e1mmD6xdcgg4tL/NRRRvfspZ+XRe2IJB69IotftVnQvd
	61B2BO/p3pLCD3DJLDArrVe6tVH17OkdE+ZyjErro0ZRr6C4Q8nTA7zUY4b8MK96gy7GxPx8Z2D
	p2vpOXsP77xeU5pqPXk+SGb7dVSYUY6tvZxm+MuU/w9y9A0FsOU8CGBdWRQrdjADOaN0S0vU/VR
	VbV7GlqFhjwcdBbk=
X-Received: by 2002:a05:600c:c166:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ba0234e9ebmr54275785e9.27.1794329282950;
        Tue, 10 Nov 2026 08:48:02 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:02 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:47 +0100
Subject: [PATCH v3 1/5] firmware: raspberrypi: Add blank line after
 declaration in response_callback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-raspberrypi-firmware-v3-1-e001feb542dd@gmail.com>
References: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
In-Reply-To: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com, Manuel Ebner <manuelebnerli@mailbox.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=696;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=5xn/m74GBcjNDWR0uXws/+MR55rEUDRNu7O7ky4ZQB8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80q/phpJnezQN84UJe9nipq2vbL5zuhJAGrUJ
 8GBmGdMGciJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKvwAKCRB4zXhFDAXI
 Z36oD/4rIr5DxiIZE/2sXkkSoXSKCCvnahjHSJ0siOs6fL/qv4vHBJIp1D1qKxaE5qg3lgMubpn
 8qVTZmSYCORqTdz62aSr74lcBOs0GkCuVnzCQYEXufazM7giUYyTLuz3wzeiaRuAYL8cHoydDyP
 G/R5jla5NxrAjA1fYSWMKFbJjs9E8pEHb8SO1p1fRr28Ttqw5xLJwm1SLdRFrFvHuG2xvyj/iLC
 SFT08h3cJMJ3H39Y6juBS1TzE2Uw3yyxizOe/aJvE1GkmRvWnMO58XXVLdlZCqfo7hPrTg4JdCy
 2l60lTy7NRoYCfb32nPOC/haFwFOHbHevP9ECXwqy+Dqvc2VYaxvtPvEb8FIBvgjErbqmNXR/u2
 g+KZUp55jlpcJ29FWc3d+whufeEMNo+78Cunmq9y4sLdbV2nA6FO/HeI2g6WTB+WdxFSVNUnvQs
 qx3F55xuuPwaGqnu9trf5qDEEPELe9G6dp69Uv/gaEbRtcZ9yB5le4lEDmEoyWJ/aUPGuueAtv0
 DB0qmQZCD+Z+nAwpW4SsF2Y56xz0s5vcX5UioFRqykVeNZP7EZvPTXaABRWkMrih9Wu+tnqtjdK
 4BziUzdFUT8CYGm8+9/OHngb1pMtQBweqLibgDAnPDu7ppAtFzPWRcIcaZ8g0qiCt9aFv+X8RR9
 QRPaAJrexib22hQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_084804_887628_2A025636 
X-CRM114-Status: GOOD (  10.77  )
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

Add a blank line after the local variable declaration.

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90f..8f3653c4a669 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -40,6 +40,7 @@ static DEFINE_MUTEX(transaction_lock);
 static void response_callback(struct mbox_client *cl, void *msg)
 {
 	struct rpi_firmware *fw = container_of(cl, struct rpi_firmware, cl);
+
 	complete(&fw->c);
 }
 

-- 
2.56.0


