Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE464606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 23:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dsH0UT+h;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KH9yeOBa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=; b=dsH0UT+hKaKypS
	p9zsjo5SQwOkWC4NoO7i8qZo9dA+aHcpVJgFZh0OdM1JIOxHsE7UqVUfXXg7QON98G1/XCST/LP6R
	6BwzFQ1vZyG29ZXRl4tIQtxsZncSyMM9+bxNwDJkunvKywkiwiqb/nwNDC8hI8VTu8LmMvEPWQXRR
	TQEcYHmFjM0HXOfQ8F89Ky8XFx9aMiz4QUDXsy004E9Hq47KrT85hlwRfuasxHqOJBmNv86WV4/1j
	rXdatont6tnt7GGzDd5lXaTi+ibLtD9P9uWbWcOHo8hBbN1FWW7KcEW1AKxAyjC3iGH0gFYcaCOdh
	+ek9U48Hw1GvwZOWciTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX59q-00000000BG7-1zcR;
	Fri, 27 Nov 2026 23:15:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX59n-00000000BFR-3ccG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 23:15:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso7591038f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 15:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821306; x=1796426106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
        b=KH9yeOBaaZ/ekVBYe//xEGGbm55Avq8808MwFwRhmpAd+Ct6kCgxqftkx3A8R674FQ
         vHbcPI2RuB8p1KNKykmtFT57bWa8MdNO/39iQA5GOudntJ/l5eFkPitaEdl8TRTF5Kbi
         H//X4pQpjHrWl9hO/2lUPUA2Eqjp5lSApMYCUxS1ZcrsLXsihEh58unXNCkdpAeH3nCH
         NZWJCqSOkvMyZ1GIqrDKCWgr9Sj93tbC4HKY2Ujg3Iy5WV5JrMlg5fzi45Aiwrlt+4N4
         RrrRlL8Yag6Bpjp60gqU2sjsjZpvJ3ALkYxJx1Lhm75Cw/3Ps9/nMSxOzS6IfUlpxivU
         Axdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821306; x=1796426106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
        b=sPgkjyxFWPbAjrsQQUkhWoudB1c3rBP6uwedcvQeZEZ0itpe2fFjJKhgsF6dGMc9KQ
         D8FZxJ4BL82vl11iykbVjAh5VRWzGf3iQnrdKSd7IfDP+KhrA+muQLCE2CSAl1kBhunQ
         XBOFjcC7IvxUxRQo63ftUAFSoBooxBa162rU8Dmdjf/TLk6HcIuLpiDn9tgTipS34yUu
         fy0nrtANF7LCbKVEhD1KvpE9+DyXhWLk3rhJTV3GQFvzrQhzlvaKXYLS0fSiskR6ybja
         EvmYqSX4rq0sB1v4nZ0QQ0Kbi/O972DauZkr31pSqZvf5YzTCqriNOa+MB/U0STDynee
         lObw==
X-Forwarded-Encrypted: i=1; AL+hErG2/i3rm+aQyBCV42t+KQa1g13M5vhau9O/+RlLD/6rnYG8sAae/BhuzrR+pbfEt8pDPPfE4dhdRr+Et6vepo3V@lists.infradead.org
X-Gm-Message-State: APuU4Z9r/h6+8tmCBfNNiFJbrxOMRLcMQd5c2WnEZYfMZc68nY6p24mz
	LIVh1+sGyZugHw/LHBlfKtVoj9HYu0JoXp8PSMzDmvsEDL7FH/cepFdH
X-Gm-Gg: AZFdTZf3VRs+vBdaXTXTqKwFpvoJsxkjR5fwaXFun2YBiiumJfuxVlJKwaXXSMcjref
	8YBcTS3Zi4GiiSTKrk8PZ/b8+IHg7TWYgj/2ApDf602tB3GDDxrGkq0WFMB4Zu/Fm25zgo+BACK
	gQxpdXPA9cGdH1kPbsmUOO7yiR2lOlfBUrpuNCPofO1TM9CA5KJHOPbd8cEwtT3E34own94K9o6
	gWmqIwLgw4cF6qwP9CDaf9BQQHLOYILVCEFUxhnBVR1z9T76Kn5sbbOtXS8c0/i3WBKzOlVGehT
	jlmA31LbnI6pGvAZjAW+go4VpLwz/feHxwM9sgReSj1flnB8sU8euMfbFEXGkpUfHyUcallhqTh
	4ji1bpoxpHp+JsWKlmouhJLlCmAZeGUqZ1TM8AVW4pgTXTDHv1dj/oVB2MYTMPrNaccSc3OnG+T
	s9BZ8yyaXgz6Ouy0jbD+EDriA4lAnvrrx+G47slNHw0atk/vurL7ZY8eO+cCgdE+aPix5U1ctYl
	9FhugypDuQK+9DbFtT6Q5w2fg1bbODbDbfJi1qaWXOUndzUq7itRDLKxC7kGuAkbOS0qXEHGvu6
	NlmleKb6nLuCT/9zTX6hWJgsQoU=
X-Received: by 2002:a05:6000:178f:b0:4bb:c85e:d565 with SMTP id ffacd0b85a97d-4bbc86e17b5mr14733028f8f.55.1795821305534;
        Fri, 27 Nov 2026 15:15:05 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm45269880f8f.23.2026.11.27.15.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:15:03 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
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
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 14/14] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Fri, 27 Nov 2026 23:14:45 +0000
Message-ID: <20261127231445.3623202-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com> <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_151507_970700_0570BA98 
X-CRM114-Status: GOOD (  11.44  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 02:58:40PM +0100, Konrad Dybcio wrote:
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the review.

I've implemented support for almost all of the hardware in my
local branch and I have found that the headset exists in multiple
revisions.

So, I'd like to make a split:

rename: halliday-samsung-xrvst2.dts -> halliday-samsung-xrvst2.dtsi
add: halliday-samsung-xrvst2-rev22.dts
add: halliday-samsung-xrvst2-rev25.dts

The .dts files will initially contain only compatibles.
The real differences between the revisions are the DMIC drive
strength, the display panels and their supply voltage, so the files
will be 'empty' until I send my sound and display series.

Is it OK if I send the split in a v4, or is it better
to do it in a follow-up?

Best regards,
Stanislav

