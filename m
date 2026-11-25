Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B28606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=athth6yx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JsokBgqQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=; b=athth6yxTZW6Wf
	TMF3HRGNDEnOtrwau3QZMwLwTjpXczU1ikHN5kEb+lvX5qK9o/X/konYKltE3n4PLrfrqA659/ky/
	ktY6hBY8EBkuzKbVW0TS5+WVgoWJqxYwERuY5SosEg5mAXN/RJAXHv7AseEPslelfRTJ8cWigOafB
	zpe2nGgVFd1Klpqnslg5+gVU5O372orTrXC/LkAZp+sb9PgKqPOD4Mry79yXD1/crdIFnrVPLj5dE
	Gv/6h5KGn4/fP8MZezewFcLJpZbKagvjC/Xbl8gDsVLgzf3ylaCXNla1bN7oaW0dIZzhvXruuF+M3
	oJlUPvwGUBm6/iKRaIgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3w0-00000008KLP-0VYW;
	Wed, 25 Nov 2026 03:44:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3vU-00000008JsC-0eIO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:44:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso64940035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 19:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578246; x=1796183046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
        b=JsokBgqQTKZwrf2ZB168m8jfwF58GchCpZzTq7I+uOLDLhPnSSg4OuEDjuQJvp+aJb
         ev7Lf/VIi6dJ3/rEW/ObmT4P9yn2S5dOAeVw9Mw5aEbAghTKSDFNo18w26dBD9BIOQuz
         yKdpqIphqbQodoYTVOH6ZDw87lZMSCjNZFrLgVE40gKUQFr33x0qL6avz3kTtd8i+/Pm
         d9P5qfnMBDcS9vZIm5Cn9CJwGH39EjyrB8zxOyrggImw03L9CLHGqDsIoQ7l32r20wxl
         cfOlIFdH07hEe9e22wDL1bB4Rz8ezbPBBxxoVxpLDwTcNWse7+nZnY+qQGh530yt/9k5
         k2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578246; x=1796183046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KIqWeS+3qt6MqJuGRe1uG41SLx0XRfx3eXbs/xUTl8=;
        b=w9tYSFkjSKTT4hZQe5NXJghhNnoAP8CSW+pl/uDZ2XTtFhgSvLsDS7Ut8QVD2QJV66
         ApbRX9+FJiF1f6pyZn6Dh/uIQJi7GC7Wq8vweJ1sGeZpPwoKVzwobCW3OS6vgcrRzwOO
         Cgz6o1cMKXUAnnOwZHv+zNn8DsLX0s2t53qJx8Xz05HH6shVcOyMO7nIfT7C8FtHz0KK
         auHjvdSG5o4Vz1bmSdkIMFkNS1sgKaYGT+U9U1mWvrekyq/MaqP7gcfzAoo0SED1pR/n
         yFOL3CndRwXZBi+RlfAtvXz0If/oVz0hD6eOB+hbzAvcN7sGlfaJaPjISqxov9V8mwq2
         zx7w==
X-Forwarded-Encrypted: i=1; AL+hErHcW5Rj9WMPhbkqsbcr29ZMUnXuTQBb7z1I0H+oFQaz29PW1XPqustORS7qz5CeygIx4sTnk1HfLbDQshdVOWGK@lists.infradead.org
X-Gm-Message-State: APuU4Z/4Yj2zY8PFZH24bsU0bDi+Pf8/FYPuQCn5u/fNqm+12Dng/fmw
	Os83CV+1Qbgj7yw6rl+14fgsobXWVUG22fitZd5XKYQp0wot6xSYbCHC
X-Gm-Gg: AZFdTZcKaxcyAdMvsOcWWymPDf4kr5lFcRuXYygNrvyqRrgzU789F6YC4Cprbrud41Q
	nY0omFTY4VjJ0XGFr7I11w5lsOvlnvC3V0kuxq/wRQjhw4nOFTige43wk4UvYFfIxTeZOLHx51h
	zU0sxV6W56bl8sK85YUL760CZ/Ds0OhoHSsUrafGnGgnK3hPF8/itbJpcFr3HxnjfOOxkqBqN6+
	HvhPz44pw5vbfH0fCPVQoiA7iBFfxoFfBkdBxLTeBW4GPISqHNwVBKy+CbmT3i0LbJnCW2riE5d
	/ZGFWUwgzZRlinnOf8Bss8MrhEPqd1tRtNuo0sXtPyB5DJBFlSHou6iD72wKklD0LxGaj3mQgPI
	b3sTM7IDXN3ouLmuilg+AJfmOG7fyMMV3Wn7d+KAHMGpWUMtPvHbov44g+hU84udZOAILgL87f1
	b6gKBaeA3i+CaQok0pPege6DuBzBQXiW4k2bXRT8cfWRPiHrXoZQSsIWP7ln4YmM9wr7oS6a7iF
	79SJFdo1Hz5MVrOad5qB7vcBpd+HJeBzh0t1F6NaMVi1FvsvgpZZolpjbI9hhWkosFNCCXxM47E
	Il8iaSY2yUw0yVLMOU6aF+xb6kVDhJJKf30uYQ==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr345180345e9.32.1795578246276;
        Tue, 24 Nov 2026 19:44:06 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:05 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:03 +0000
Subject: [PATCH v3 07/14] dt-bindings: ufs: qcom,sc7180-ufshc: Add Halliday
 UFS
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-halliday-dts-v3-7-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=1101;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QhWGZ2nDLik/AVSmlPnUVJyIcZFTcrhPWPSMCAukIeM=;
 b=6AJhs5Z6f/n9pNkfdd62Z4MaOrVcciMknCqzjBkVEi354abH/HUGDZk9PowwAyDuxfg/8VsUi
 qlXYQzCUXxLD5rZQ1VTRb8Bh7LUtJE1bI5xcjBVOagvzX82tdchlf+N
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_194408_452506_2F3E61EA 
X-CRM114-Status: GOOD (  10.78  )
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

Document the UFS host controller on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index 3c407426d697..5d1784baddd7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,halliday-ufshc
           - qcom,milos-ufshc
           - qcom,msm8998-ufshc
           - qcom,qcs8300-ufshc
@@ -40,6 +41,7 @@ properties:
           - const: qcom,ufshc
       - items:
           - enum:
+              - qcom,halliday-ufshc
               - qcom,milos-ufshc
               - qcom,msm8998-ufshc
               - qcom,qcs8300-ufshc

-- 
2.55.0


