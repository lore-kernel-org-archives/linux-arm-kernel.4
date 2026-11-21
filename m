Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E41606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 07:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Icxxe+WN;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=TcRsveG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7mxM6MIDH0aR1FQkJ1yLZRiYvWzEi04wwfe+JsQjwbQ=; b=Icxxe+WNKWTqbz
	ui9ytLeeXZLAIeGt+QWsJ+4Fwkz5eYQibcujnv+CeyIu/mH4HWCvN7tDAhrIpFt5l7UI5xE2niEmk
	k4qBOVlrdRp3AB8jDW5V/fgSV3rCTpGga0J8j1zfwLqAUhJViQC0/AZQOFwLA8A+3ibQ8KCQuLbAC
	Ff0QxB801GoB51Modb6IETDK538fU9kUk58FV5oCaK94oAM5XVUQk6JHvAHGxfk4zuwhyib4+5NEM
	gkv1kf7b0HpIiQcSEGKJAg8IWRq+bqkohwj3irHgapDOUeA/fsvThoD5yrHX5vFkS5GhbhMriPVii
	eAezdflSx7euPuwAOOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfx3-0000000Gtwq-2FF6;
	Sat, 21 Nov 2026 07:56:01 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUfx0-0000000Gtus-1NNN;
	Sat, 21 Nov 2026 07:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795247755; bh=7mxM6MIDH0aR1FQkJ1yLZRiYvWzEi04wwfe+JsQjwbQ=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=TcRsveG2AbrsnaqpYfnks4PIZv+TQlPwTYUg8Io8uS1zdyW7GHsbvJ3vNRh573J0Y
	 x4KS5rMEXdgQoEuF39Mi+cdaC6LEcfCsxuc0dyk0JV9vQ2d9CMASUVKQAA7qLMJdg7
	 KSI1KrmrRhjFOtZO/8hx6oMFrle64+XZNCAEL0Vs=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-XMAILINFO: OSyReP17gB4cKQmSsJziajQRELaeaISQ14wOwDxwAF59+KLu8xv/uYqLReyat3
	 4Q3UxgGiGdJ3F6udmLTZez07vwbyQsy7fyZIckjcqljemmB51nOiP3Q6DGazjoGovuiy6yfVg1Nqz
	 nmH7EXEtISq8zxAn1vLcsz0TkwgSF18cYPfb56EH+ksnTdx/OBgXktG6E8V+330TXEwcXCX0mYZlr
	 VWdmgci9U4mJNKRJAW5Das2ay1Gh+yKV/iYfoMUbFBrlNwD4upv1O+hoF5BHrqnafPNnBFy/vQO2J
	 AwlNRDGHa5mtBpDxwbGGDkt3MO1njO+F1xv5m/Th9IKz9MS8RHiC0K/KzBYd2c3fFIFWSnnA+UMSh
	 siG/g+9TK0l2HthiuXyP6jgINzxrSxgXDI86EH4pV+dB4iyiFS1bg3pySa8V0s9O1blCOOYBM19mR
	 Im8UY855tvXBowbO9mXFr8SJD8n3uznWfGnbscZeFmA7WOzrO4EYTtuZsg4fUp+DqH9xjcMgscmv0
	 X1eueaKNCYxw1zOMeT0qvsL5VNyvaP/w+5DlYDmbGNR1eePXNwO0MMhYaRKyah9wCG5b46dccr2EI
	 daSQo+laKcjS3lrLDJWyAJieIZX7OPK4Gq0bHqlx1CoiLv1OHLqLLOoSclCJ2U5PZaRn+0dsN/fgH
	 2s+NXvv7Eqwkb4cRuwFtTwDt0iAam6TTt+Qf+MQI6b3sWPxT41E6DH7WpoUDMTEFdP2Ny+RrhQ5tb
	 qsD5X7XqGFHo+qNmpJ9gqqTz3gM5lSdJWnZgKVW/2KpKi9Ba5loX9yjyt1MBecuIweVATvLIskWD2
	 LHON63qGPDtdLqDrnTHXhtK3sIIHlnmaUSxb1282+hgBbhkCTQrdSUxQxpT2rCk0VPDHo25SMyhnt
	 LOBe+shDZGeMdGb12rvlowB3jUws+YMM2k3qrtjWy3K2Jj4ciZJabYLeSYT0s/LRSI4hIQQEMDOKt
	 N3UcJd2wBxZDpMBjVzhlDGbs7LvWt7Ri0Ao6Dfj0PQRtww9dE3E181bGqnXczvHWwx/1QuHdPgT2W
	 PIUm7gMeBNLM5Lqg+Z/x1CproSdkDVOoMZKdUw1CYA5UvmVNB/GOuzA5IcMGYv27vhAEpmnwXYBtE
	 CgotIPiIoHlyfpyYI58Sn+Nl
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?bmV0ZGV2LWJvdCtzYXNoaWtv?=" <netdev-bot+sashiko@kernel.org>
Cc: "=?utf-8?B?bWts?=" <mkl@pengutronix.de>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?bWFpbGhvbA==?=" <mailhol@kernel.org>, "=?utf-8?B?aGVpa28=?=" <heiko@sntech.de>, "=?utf-8?B?c29ja2V0Y2Fu?=" <socketcan@hartkopp.net>, "=?utf-8?B?ZGF2ZW0=?=" <davem@davemloft.net>, "=?utf-8?B?ZWR1bWF6ZXQ=?=" <edumazet@kernel.org>, "=?utf-8?B?a3ViYQ==?=" <kuba@kernel.org>, "=?utf-8?B?cGFiZW5p?=" <pabeni@redhat.com>, "=?utf-8?B?aG9ybXM=?=" <horms@kernel.org>, "=?utf-8?B?Y29yYmV0?=" <corbet@lwn.net>, "=?utf-8?B?c2toYW4=?=" <skhan@linuxfoundation.org>, "=?utf-8?B?cmR1bmxhcA==?=" <rdunlap@infradead.org>, "=?utf-8?B?d2c=?=" <wg@grandegger.com>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, 
	"=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtZG9j?=" <linux-doc@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: Re: [PATCH net v10 05/10] can: rockchip_canfd: cancel bus-off restart before closing the device
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 21 Nov 2026 15:55:52 +0800
X-Priority: 3
Message-ID: <tencent_A569B865F0120446D40306100DFD749AAA09@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261119-rockchip-canfd-restart-close-v10-5-df23913aa33a@qq.com>
	<179521933978.3131.189047644390163242@kernel.org>
In-Reply-To: <179521933978.3131.189047644390163242@kernel.org>
X-QQ-mid: xmsezb41-0t1795247752td0sekuhj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_235558_793048_AFEF3405 
X-CRM114-Status: GOOD (  11.95  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgo+IFtTZXZlcml0eTogTG93XQo+IElzIHRoaXMgZXhwbGFuYXRpb24gY29tcGxldGU/
IExhdGUtcXVldWVkIHJlc3RhcnQgd29yayBkb2VzIG5vdCBoYXZlIHRvCj4gd2FpdCBmb3Ig
dGhlIGZpbmFsIGNhbmNlbC4gV2l0aCBhIHNob3J0IHJlc3RhcnRfbXMgaXQgY2FuIHJ1biBh
bnl3aGVyZQo+IGJldHdlZW4gdGhlIGVhcmx5IGNhbmNlbCBhbmQgY2xvc2VfY2FuZGV2KCku
Cj4gCj4gWy4uLl0KPgo+IENvdWxkIHRoZSBjb21taXQgbWVzc2FnZSBzYXkgdGhhdCBsYXRl
IHdvcmsgd2hpY2ggcnVucyBiZWZvcmUgdGhlIGZpbmFsCj4gY2FuY2VsIGlzIHN0b3BwZWQg
YnkgdGhlIG5ldGlmX3J1bm5pbmcoKSBjaGVjayBpbiBjYW5fcmVzdGFydCgpPyBDb3VsZAo+
IHRoZSBuZXRpZl9ydW5uaW5nKCkgcGF0Y2ggYWxzbyBiZSBsaXN0ZWQgYXMgYSBzdGFibGUg
cHJlcmVxdWlzaXRlPwoKWWVzLCB0aGF0IGRpc3RpbmN0aW9uIG1hdHRlcnMuIEl0IG5lZWRz
IDAzLzEwIGFzIHdlbGwuIEJvdGgKcHJlcmVxdWlzaXRlcyBhcmUgYWxyZWFkeSBtYXJrZWQg
Zm9yIHN0YWJsZSBpbiB0aGlzIHNlcmllcywgc28gdGhlCnN0YWJsZSBydWxlcyBkbyBub3Qg
cmVxdWlyZSBhbm90aGVyIHByZXJlcXVpc2l0ZSB0YWcgaGVyZS4KCkJlc3QgcmVnYXJkcywK
Q3VuaGFvIEx1Cg==


