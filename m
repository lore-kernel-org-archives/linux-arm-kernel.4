Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C933606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pA8D5+pf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQVUEcJt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=; b=pA8D5+pfNMS5UP
	1eU6Ir0aQoV+tRWjEYdbjDCAOWbe20SpFuLFo7R1rZt1ErAkqcN9nW9UL3I9moIynHT2S8DKkSv9Y
	t9woeLA6hxX5WGRZqVZvu3E5NCHltDuDRVYJDQN066ZTrfB0+IIULcw/YIXzNPTQ2vXbux5cs/Nem
	Emh5y4pPZ/r/ivBxqVGOqNo6xrN0lzkClYo4GISB8Dlff1s185vTJxHFTI1O4I9VpyYEfDjt48/ox
	iQ64t8uSvKcJwu2Fp7IF03Eii9kpM0cKcUdmKidepFu6P228LmiCBIBQ67bFDObLEbcGNo8GzcUWk
	4WbH0K7o/nr1zUxHzK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTKo-00000001MrZ-1KPV;
	Mon, 09 Nov 2026 17:39:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTKc-00000001Mni-2099
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:39:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso8238675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794245936; x=1794850736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
        b=GQVUEcJt0s2zkSx2+YBLd4GOxu5iYtLOLOFRamhjxWFv822ZEiXQxgQw2DHFQZN/4z
         5XTvQpc+sn5MYgI4fxN20UWjDk621QKggBCUdKhhmKHalTQxQ+7rnkEQvR3f2jNMhlRM
         Qfcu9nHshuyE+fcWRK2XFeqnQYVpLBde2WA/ufPxPF/ScZ6wtZOndo5Whuln5JV1r4mO
         yzhZlOTazFChy82pNjcJKq6HOSpBce7mhRfH7LzPBpEFEQyDAAfY4YMh40FhY3ixKj1K
         W+MzB9wWqJ04IY2dK5RoADJF0tZZdRsTam0PVUODgPB3TrpCjci4zME8by0v3VWFBiFz
         DtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794245936; x=1794850736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSgAu1YCz0/TBDQtz025D2yh3sRQq8BFfiF0sq3qrAw=;
        b=JyA32AS+wQuytoaghSenZxQtSBdo6iI+g2aZ87d2xwvJMxBHSDxqksyD1c9/CP5izm
         dEfVOODNv7tj8smG7nGsY4vXClPVf5Lsc7TcvhnyLBcne0WCSthlS0lCuARVNz+kO/Rw
         +lCI7HxNOiQHgKXVDgYB3Ug213AlZN5nwnyfZtkr54cMIuY5EXm1esU0/YmwbqE0qL6u
         5PmqtSFkhByEdg2o2l8xYyxOXPjGLDE2uqJTKcZYhnuqFUpBnO+El3tqwm7UuD+Jv2Se
         YEh7tbVZQnpmZd+AnwlU0auKzXJnWyggdFnRB/MznbXyQWQwjX4ri/rDM7/cFcRk+vt9
         QzOA==
X-Forwarded-Encrypted: i=1; AL+hErESmtpKk0tDzCoovVQ2488u3Yf2Jxm7cRGTzdDCxavWHuZcsUpkqjHn9WrxppGVsXbAAqqx580FXNzBJUzSqneE@lists.infradead.org
X-Gm-Message-State: APuU4Z/2wLQsUmBhGS6I1xCEdnM2Um8l/89oFxKJ3mCRfGFfiMNLcr8R
	miChf+/bHrq5/AuGzaLNeO+tcqqU86bRf1TCks9a2BugXxvuqupY+leo
X-Gm-Gg: AYBFou1SwcToVNcJZkeiGP4yHhD+hqmkqIiP9LS3n87QXZg4IZ6/h7hOlnEgBd7LnMX
	jLebG/9m9so/FS+sfu/kdJZHvMTyETNFJ7WnWLG3raSuNLVOUFawrKePug1OaJ5OBGHWS9VDu9a
	lM3wdBj1NjmAhVGpVd0BrqU0qx9CjiXyDneas/IMdKOTNzMHZMWRhNgR102brBpweDVEmZ4BbyA
	Z/vteEk+YHLp38AO0kWteBZO9jQsXW6RHDYTLXIceZtVrpzYCXHHSaOeVzqqY1F5V3dVV82o/7I
	TCpg5jAv24rGVU9hLTTGjtzBSYE/ZbRUmP0qw1T60SFMb9nJHfUq6ABEctB4div/dktCuUdoHb2
	u/4Z9ggwYuJtdWxMrvIDFPcdy+JqRLrwTeaO4AxBjy0e6BN7KUePhR+9ihZf7W39J3ESIzmAfk9
	D+5rl/orli/FWPorYveqXn3a8RKpSQLvyJvHG2yN6lyvguJXRusx6E1c1BbRqAfwYGH9jpoE16B
	FbbdN+BNXZfyQqiL+XDOyh02ypObQL5WfJf6Nue+oozR3I4wSVtep9CEqbkex+St2n/cpaNSqjO
	xtHA3Zqp1EKDrjX9/iHCeVeDlo8=
X-Received: by 2002:a05:600c:608a:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4b94d76329cmr92154365e9.1.1794245936334;
        Mon, 09 Nov 2026 09:38:56 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0157b707sm2522005e9.0.2026.11.09.09.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:38:54 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 01/17] dt-bindings: arm: qcom-soc: Add Halliday
Date: Mon,  9 Nov 2026 17:38:37 +0000
Message-ID: <20261109173837.2084788-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <78a88d4d-11af-40c1-b063-b6a4d4298ecd@kernel.org>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-1-289114ab8197@gmail.com> <78a88d4d-11af-40c1-b063-b6a4d4298ecd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_093902_093004_3082B285 
X-CRM114-Status: GOOD (  11.09  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 09:25, Krzysztof Kozlowski wrote:
> This should be squashed with patch #15. Also, there is no benefit in
> organizing patches within patchset where patches to the SAME subsystem
> are split all over. #1 and #2 targets SoC, then there is a break and
> again we are at SoC at #15.

Thanks, I'll squash it into #15 and keep the SoC patches together in v2.

Stanislav

